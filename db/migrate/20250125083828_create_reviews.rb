class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
