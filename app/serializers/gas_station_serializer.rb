class GasStationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :latitude, :longitude, :price
end
