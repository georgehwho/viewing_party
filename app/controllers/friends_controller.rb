class FriendsController < ApplicationController
  def create
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end