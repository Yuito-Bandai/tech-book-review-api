class ChangeIdToStringGoogleInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :id, :string, null: false, primary_key: true
  end
end
