class PostsController < ApplicationController

  before_action :verify_post_author, only: [:edit, :update, :destroy ]

  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to sub_url(@post.subs.first)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to sub_url(@post.subs.first)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @sub = @post.sub
    @post.destroy
    redirect_to sub_url(@sub)
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
