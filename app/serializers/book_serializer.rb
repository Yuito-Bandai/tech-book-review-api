class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :tag_names

  def tag_names
    object.tags.pluck(:name)
  end
end
