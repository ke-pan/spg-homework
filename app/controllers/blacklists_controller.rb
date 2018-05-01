class BlacklistsController < ApplicationController
  def create
    user1 = find_user(requestor_params)
    user2 = find_user(target_params)
    Blacklist.create!(user_id: user1.id, target_id: user2.id)
    render json: { success: true }
  end


  private
  def requestor_params
    params.require(:requestor)
  end

  def target_params
    params.require(:target)
  end

  def find_user(email)
    User.find_or_create_by!(email: email)
  end
end
