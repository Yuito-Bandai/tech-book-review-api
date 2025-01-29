class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  self.primary_key = 'id'

  def self.create_from_google_books_data(data)
    create(
      id: data[:id],
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

  # こっちは表示用のデータを構築するだけなので、データベースに保存しない
  def self.build_from_google_books_data(data)
    return nil if data[:id].blank? # IDが空の場合はデータを構築しない
    # Rails.logger.info("Building book data from Google Books API: #{data.inspect}")OKだった
    new(
      id: data[:id],
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
