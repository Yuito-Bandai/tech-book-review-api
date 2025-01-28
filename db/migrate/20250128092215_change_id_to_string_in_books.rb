class ChangeIdToStringInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :id, :string
  end
end
