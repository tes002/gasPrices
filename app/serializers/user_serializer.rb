class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :latitude, :longitude
end
