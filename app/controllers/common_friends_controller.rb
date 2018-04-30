class CommonFriendsController < ApplicationController
  before_action :validate_params, only: :index

  def index
    user1 = find_user(friend_params[:friends].first)
    user2 = find_user(friend_params[:friends].second)
    emails = User.where(
      id: (Friendship.where(user: user1).pluck(:friend_id) & Friendship.where(user: user2).pluck(:friend_id))
    ).pluck(:email)
    render json: {
      success: true,
      friends: emails,
      count: emails.count
    } 
  end  
  
  private
  def validate_params
    if friend_params[:friends].blank? || friend_params[:friends].length < 2
      render json: { success: false, message: 'needs two emails'}, status: :bad_request
    end
  end

  def friend_params
    @friend_params ||= params.permit(friends: [])
  end

  def find_user(email)
    User.find_by!(email: email)
  end
end
