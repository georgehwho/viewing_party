class UsersController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
    if current_user
      redirect_to dashboard_path
    else
      @user = User.new
    end
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
