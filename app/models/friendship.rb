class Friendship < ApplicationRecord
  belongs_to :user
  validates :uname, presence: true
end
