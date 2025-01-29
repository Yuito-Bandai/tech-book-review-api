class ReadingStatus < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :status, inclusion: { in: %w[reading completed want_to_read] }
end
