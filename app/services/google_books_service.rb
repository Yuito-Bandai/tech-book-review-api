require 'rest-client'

class GoogleBooksService
  BASE_URL = 'https://www.googleapis.com/books/v1/volumes'
  API_KEY = ENV['GOOGLE_BOOKS_API_KEY']

  def self.search_books_by_id(book_id)
    response = RestClient.get("#{BASE_URL}/#{book_id}", params: { key: API_KEY })
    parse_book_data(JSON.parse(response.body))
  rescue RestClient::NotFound
    nil
  rescue StandardError => e
    Rails.logger.error("Failed to fetch book from Google Books API: #{e.message}")
    nil
  end

  def self.search_by_query(query)
    response = RestClient.get(BASE_URL, { params: { q: query, key: API_KEY } })
    JSON.parse(response.body)['items'].map { |item| parse_book_data(item) }
  rescue StandardError => e
    Rails.logger.error("Failed to search books from Google Books API: #{e.message}")
    []
  end

  def self.parse_book_data(data)
    volume_info = data['volumeInfo']
    return nil unless volume_info

    {
      title: volume_info['title'],
      published_date: volume_info['publishedDate'],
      image_link: volume_info['imageLinks']&.dig('thumbnail'),
      info_link: volume_info['infoLink'],
      isbn: volume_info['industryIdentifiers']&.find { |id| id['type'] == 'ISBN_13' }&.dig('identifier'),
      author: volume_info['authors']&.join(', '),
      publisher: volume_info['publisher'],
      description: volume_info['description']
    }
  end
end
