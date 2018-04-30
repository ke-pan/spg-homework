class User < ApplicationRecord
    has_many :friendships
    has_many :friends, class_name: 'User', through: :friendships, source: :friend
    validates :email, presence: true, uniqueness: true, email_format: {message: 'it is not a valid email'}
end
