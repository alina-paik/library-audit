class Category < ApplicationRecord
  has_and_belongs_to_many :books

  validates  :name, presence: true,
             lenth: { maximum: 25 }
end
