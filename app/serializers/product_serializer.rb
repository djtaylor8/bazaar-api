class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :listing_type, :price, :total_available, :user_id 
end
