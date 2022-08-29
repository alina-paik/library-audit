class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book_id, :user_id, presence: true
  validates :value, length: { maximum: 200 }
end
