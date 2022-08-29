class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book 

  validates :book_id, :user_id, presence: true
  validates :value, lenth: { maximum: 200 }
end
