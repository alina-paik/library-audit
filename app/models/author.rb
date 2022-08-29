class Author < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books

  validates :user_id, :name, presence: true
  validates :name, length: { maximum: 50 }
end
