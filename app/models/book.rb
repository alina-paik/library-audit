# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors

  validates :name, :description, presence: true
  validates :description, length: { maximum: 500 }
end
