class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :city, :state, :user_id, :total, :created_at, :order_number
end
