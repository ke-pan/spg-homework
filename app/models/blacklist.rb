class Blacklist < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: 'User'
  validate do |blacklist|
    errors.add(:base, 'can not self-blacklist') if blacklist.user_id == blacklist.target_id
  end
end
