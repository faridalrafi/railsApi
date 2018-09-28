class User < ApplicationRecord
    has_many :tweets
    EMAIL_REGEX = /\A[\w+\-.]+@(?!mailinator.com)[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX}
end
