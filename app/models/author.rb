class Author < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :books

  validates :name, presence: true,
            length: { maximum: 50 }
end
