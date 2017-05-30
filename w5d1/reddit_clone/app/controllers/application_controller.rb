class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_sign_in
    redirect_to new_session_url unless logged_in?
  end

  def verify_sub_author
    redirect_to subs_url unless current_user.subs.exists?(id: params[:id])
  end

  def verify_post_author
    redirect_to subs_url unless current_user.posts.exists?(id: params[:id])
  end

end
