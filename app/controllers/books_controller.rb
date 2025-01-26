class BooksController < ApplicationController
  def index
    if params[:query].present?
      books = search_books_from_google(params[:query])
    else
      books = Book.limit(15) # データベースから15件取得
    end

    render json: books, each_serializer: BookSerializer
  end

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
    results.map do |book_data|
      Book.build_from_google_books_data(book_data) # データベースには保存せず、表示用にデータを構築
    end.compact
  end
end
