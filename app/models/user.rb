class User < ApplicationRecord
    has_many :friendships, dependent: :destroy
    validates :uname, uniqueness: true
    has_secure_password
end
