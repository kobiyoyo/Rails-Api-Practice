class PhotoSerializer < ActiveModel::Serializer
  attributes :id,:title,:photo_url_string
  has_many :comments
end
