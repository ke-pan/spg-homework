class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate do |friendship|
    errors.add(:base, 'can not self-friend') if friendship.user_id == friendship.friend_id
  end

  validate do |friendship|
    if Blacklist.exists?(target_id: friendship.user_id, user_id: friendship.friend_id)
      errors.add(:base, "user:#{friendship.friend_id} blocks user:#{friendship.user_id}") 
    end
    if Blacklist.exists?(target_id: friendship.friend_id, user_id: friendship.user_id)
      errors.add(:base, "user:#{friendship.user_id} blocks user:#{friendship.friend_id}") 
    end
  end
end
