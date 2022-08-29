class Book < ApplicationRecord
  has_many :comment
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors

  validates :author_id, :category_id, :name, :description, presence: true
  validates :description, length: { maximum: 500 }
end
