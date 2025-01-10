class AddDetailsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :price, :float
    add_column :books, :rating, :float
    add_column :books, :pages, :integer
    add_column :books, :weight, :float
    add_column :books, :language, :string
    add_column :books, :publisher, :string
    add_column :books, :isbn, :string
    add_column :books, :amazon_url, :string
  end
end
