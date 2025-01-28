class BooksController < ApplicationController
  def index
    if params[:query].present?
      books = search_books_from_google(params[:query])
      # Rails.logger.info("Books to be returned: #{books.map(&:as_json)}") # デバッグ用
    else
      books = Book.limit(15) # データベースから15件取得
    end

    render json: books, each_serializer: BookSerializer
  end

  # 本がなければ保存する
  def show
    book = Book.find_by(id: params[:id])

    if book.nil?
      book_data = GoogleBooksService.search_books_by_id(params[:id])
      if book_data
        book = Book.create_from_google_books_data(book_data)
      end
    end

    if book
      render json: book, serializer: BookSerializer
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  private

  def search_books_from_google(query)
    results = GoogleBooksService.search_by_query(query)
    # Rails.logger.info("Search results from Google Books API: #{results.map(&:as_json)}") # デバッグ用(ここまではOK)
    results.map do |book_data|
      book = Book.build_from_google_books_data(book_data) # データベースには保存せず、表示用にデータを構築
      # if book # bookがnilでない場合
      #   Rails.logger.info("Book data built from Google Books API: #{book.as_json}") # デバッグ用
      # else
      #   Rails.logger.info("Book is nil for data: #{book_data}") # bookがnilの場合のデバッグ用
      # end
      book
    end.compact

  end
end
