class FriendshipsController < ApplicationController
  before_action :validate_params, only: :create
  
  def create
    user1 = find_user(friendship_params[:friends].first)
    user2 = find_user(friendship_params[:friends].second)
    Friendship.create!(user_id: user1.id, friend_id: user2.id)
    Friendship.create!(user_id: user2.id, friend_id: user1.id)
    render json: { success: true }
  end


  private
  def validate_params
    if friendship_params[:friends].blank? || friendship_params[:friends].length < 2
      render json: { success: false, message: 'needs two emails'}, status: :bad_request
    # elsif friendship_params[:friends].first == friendship_params[:friends].second
    #   render json: { success: false, message: 'emails should be different'}, status: :bad_request
    end
  end

  def friendship_params
    @friendship_params ||= params.permit(friends: [])
  end

  def find_user(email)
    user = User.find_or_create_by!(email: email)
  end
end
