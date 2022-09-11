class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :authors
end
