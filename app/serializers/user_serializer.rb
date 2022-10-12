# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :phone_number, :email, :admin
end
