# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :value, :book_id, :user_id
end
