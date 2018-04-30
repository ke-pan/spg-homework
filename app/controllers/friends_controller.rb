class FriendsController < ApplicationController
  def index
    user = User.find_by(email: params[:email])
    if user
      render json: {
        success: true,
        friends: user.friends.pluck(:email),
        count: user.friends.count
      }
    else
      render json: {
        success: false,
        message: 'email does not exist'
      }, status: :bad_request
    end
  end
end
