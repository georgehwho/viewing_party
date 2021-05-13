class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
    redirect_to dashboard_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Your email or password are incorrect'
      render :new
    end
  end
end
