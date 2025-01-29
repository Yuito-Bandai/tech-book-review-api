class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :published_date, :image_link, :info_link, :isbn, :author, :publisher, :description
end
