class CommentSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :user_id, :content
end
