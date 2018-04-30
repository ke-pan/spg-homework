class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true, email_format: {message: 'it is not a valid email'}
end
