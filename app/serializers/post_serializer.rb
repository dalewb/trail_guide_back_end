class PostSerializer < ActiveModel::Serializer
  attributes :id, :commodity_id, :date_needed, :date_posted, :priority, :location_id
  belongs_to :user
  belongs_to :commodity
end
