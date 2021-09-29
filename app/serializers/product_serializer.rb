class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :type, :price, :total_available, :category_id, :user_id 
end
