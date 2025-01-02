class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :category_name, :tag_names

  def category_name
    object.category&.name
  end

  def tag_names
    object.tags.pluck(:name)
  end
end
