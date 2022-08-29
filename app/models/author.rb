class Author < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books 

  validates :user_id, :name, presence: true
  validates :name, lenth: { maximum: 50 }
end
