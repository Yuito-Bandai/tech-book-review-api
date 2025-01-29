class BooksAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author
end
