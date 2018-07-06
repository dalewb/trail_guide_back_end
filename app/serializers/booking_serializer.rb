class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :location_id, :date, :time
  belongs_to :location
  belongs_to :user 
end
