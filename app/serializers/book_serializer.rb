# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :authors
end
