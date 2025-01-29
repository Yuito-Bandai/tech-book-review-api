class CreateReadingStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :reading_statuses do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :status
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
