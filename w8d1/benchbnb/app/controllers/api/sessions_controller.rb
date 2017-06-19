class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      log_in(@user)
      render :show
    else
      render json: ["Invalid log in."], status: 422
    end

  end

  def destroy
    log_out!
    render json: {}
  end

end
