class CreateBooksAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :books_authors do |t|
      t.integer :book_id
      t.integer :author_id

      t.timestamps
    end
  end
end
