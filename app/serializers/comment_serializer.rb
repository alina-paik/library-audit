class CommentSerializer < ActiveModel::Serializer
  attributes :id, :value, :book_id, :user_id
end
