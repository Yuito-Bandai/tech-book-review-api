class ChangeBookIdTypeInReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :book_id, :string
  end
end
