class AddFieldsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :publisher, :string
    add_column :books, :description, :text
  end
end
