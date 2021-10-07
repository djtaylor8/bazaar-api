class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :image, :google_token
    has_one :cart
    has_many :orders 
  end