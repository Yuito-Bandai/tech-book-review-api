class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_date
      t.string :image_link
      t.string :info_link
      t.string :isbn

      t.timestamps
    end
  end
end
