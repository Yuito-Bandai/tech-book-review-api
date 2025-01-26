class Book < ApplicationRecord
  def self.create_from_google_books_data(data)
    create(
      title: data[:title],
      published_date: data[:published_date],
      image_link: data[:image_link],
      info_link: data[:info_link],
      isbn: data[:isbn],
      author: data[:author],
      publisher: data[:publisher],
      description: data[:description]
    )
  end

  def self.build_from_google_books_data(data)
    new(
      title: data[:title],
      published_date: data[:published_date],
      image_link: data[:image_link],
      info_link: data[:info_link],
      isbn: data[:isbn],
      author: data[:author],
      publisher: data[:publisher],
      description: data[:description]
    )
  end
end
