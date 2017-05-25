class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])

    if @user
      render :show
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #logon(user)
      redirect_to new_user_url
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
