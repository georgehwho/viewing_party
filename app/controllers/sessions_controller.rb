class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
    redirect_to dashboard_path if current_user
    @user = User.new
  end

  def create
    credentials = user_params
    user = User.find_by(email: credentials[:email])

    if user && user.authenticate(credentials[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Your email or password are incorrect'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
