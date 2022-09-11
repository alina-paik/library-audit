class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :phone_number, :email, :admin
end
