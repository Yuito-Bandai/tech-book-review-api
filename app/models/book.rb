class Book < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :tags
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
end
