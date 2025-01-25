class Book < ApplicationRecord
  has_many :bookmarks
  has_many :reading_statuses
  has_many :likes
  has_many :reviews
  has_many :books_authors
  has_many :authors, through: :books_authors

  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true

  # ISBNで本を検索するメソッド
  def self.find_by_isbn(isbn)
    find_by(isbn: isbn)
  end
end
