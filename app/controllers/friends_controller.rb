class FriendsController < ApplicationController
  def index
    user = User.find_by!(email: params[:email])
    render json: {
      success: true,
      friends: user.friends.pluck(:email),
      count: user.friends.count
    }
  end
end
