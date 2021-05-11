class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params["email"])
                .try(:authenticate, params["password"])

    if user
      sessions[:user_id] = user.id
    end
  end
end