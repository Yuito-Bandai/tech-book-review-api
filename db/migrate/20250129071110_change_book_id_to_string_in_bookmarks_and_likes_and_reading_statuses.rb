class ChangeBookIdToStringInBookmarksAndLikesAndReadingStatuses < ActiveRecord::Migration[6.0]
  def change
    change_column :bookmarks, :book_id, :string
    change_column :likes, :book_id, :string
    change_column :reading_statuses, :book_id, :string
  end
end
