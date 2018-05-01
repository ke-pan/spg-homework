class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: 'User'
  validate do |subscription|
    errors.add(:base, 'can not self-subscribe') if subscription.user_id == subscription.target_id
  end
end
