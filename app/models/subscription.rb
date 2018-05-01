class Subscription < ApplicationRecord
  validate do |subscription|
    errors.add(:base, 'can not self-subscribe') if subscription.user_id == subscription.target_id
  end
end
