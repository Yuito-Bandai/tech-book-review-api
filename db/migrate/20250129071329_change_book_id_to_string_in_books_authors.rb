class ChangeBookIdToStringInBooksAuthors < ActiveRecord::Migration[6.0]
  def change
    change_column :books_authors, :book_id, :string
  end
end
