class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :published_date, :image_link, :info_link, :isbn
  has_many :authors, serializer: AuthorSerializer # Bookに関連する著者を含める
end
