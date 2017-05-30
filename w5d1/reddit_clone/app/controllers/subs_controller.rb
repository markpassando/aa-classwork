class SubsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :verify_sub_author, only: [:edit, :update]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    #@sub = current_user.subs.find_by(id: params[:id])
    @sub = Sub.find(params[:id])

    # if @sub
    #   render :edit
    # else
    #   redirect_to subs_url
    # end

  end

  def update
    #@sub = current_user.subs.find(params[:id])
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
