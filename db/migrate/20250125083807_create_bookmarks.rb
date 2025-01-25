class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
