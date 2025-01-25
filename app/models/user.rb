class User < ApplicationRecord
  has_secure_password

  has_many :bookmarks
  has_many :reading_statuses
  has_many :likes
  has_many :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
