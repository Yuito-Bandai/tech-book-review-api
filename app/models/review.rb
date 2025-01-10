class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :content, presence: { message: "can't be blank" }

  validate :user_must_exist

  private

  # ユーザーが必須であることを検証
  def user_must_exist
    errors.add(:user, "must exist") unless user.present?
  end
end
