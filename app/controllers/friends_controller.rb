class FriendsController < ApplicationController
  def create
    friend = User.find_by(email: user_params[:email])

    if friend.present?
      if current_user == friend
        flash[:error] = 'You cannot be your own friend!'
      elsif current_user.friends.include?(friend)
        flash[:error] = 'You already added this friend!'
      else
        current_user.friends << friend
      end
    else
      flash[:error] = 'Friend not found!'
    end

    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end