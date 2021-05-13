class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authorize
    redirect_to root_path, notice: 'Please Log In' unless current_user
  end
end
