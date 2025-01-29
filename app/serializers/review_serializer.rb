class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :created_at, :updated_at
end
