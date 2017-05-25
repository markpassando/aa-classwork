class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_user_by_credentials(session_params[:email], session_params[:password])

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
