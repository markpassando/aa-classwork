class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    begin
      user = User.find(params[:id])
      render json: user
    rescue
      render text: "user not found"
    end
  end

  def create
    new_user = User.new(user_params)

    if new_user.save
      render json: new_user
    else
      render(
      json: new_user.errors.full_messages, status: :unprocessable_entity
    )
    end
  end


  def update
      updated_user = User.find(params[:id]).update(user_params)
      render json: updated_user
  end

  def destroy
      begin
        found_user = find_user
        found_user.destroy
        render json: found_user
      rescue
        render text: "user not found"
      end
  end

  private
  def user_params
    params[:user].permit(:name, :email, :username)
  end

  def find_user
    User.find(params[:id])
  end

end
