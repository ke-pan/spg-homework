class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate do |friendship|
    errors.add(:base, 'can not self-friend') if friendship.user_id == friendship.friend_id
  end
end
