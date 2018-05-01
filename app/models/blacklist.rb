class Blacklist < ApplicationRecord
  validate do |blacklist|
    errors.add(:base, 'can not self-blacklist') if blacklist.user_id == blacklist.target_id
  end
end
