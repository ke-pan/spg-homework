class User < ApplicationRecord
    has_many :friendships
    has_many :friends, class_name: 'User', through: :friendships, source: :friend
    has_many :subscription, foreign_key: :target_id
    has_many :subscribers, class_name: 'User', through: :subscription, source: :user
    has_many :blacklists, foreign_key: :target_id
    has_many :blockers, class_name: 'User', through: :blacklists, source: :user

    validates :email, presence: true, uniqueness: true, email_format: {message: 'it is not a valid email'}
end
