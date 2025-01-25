class BooksController < ApplicationController
  def index
    books = Book.includes(:authors) # 著者情報も一緒に読み込む

    # タイトルで検索
    if params[:title].present?
      books = books.where('title LIKE ?', "%#{params[:title]}%")
    end

    # 著者名で検索
    if params[:author].present?
      books = books.joins(:authors).where('authors.name LIKE ?', "%#{params[:author]}%")
    end

    # 最大15件を返す
    books = books.limit(15)

    render json: books, each_serializer: BookSerializer
  end

  def show
    book = Book.find(params[:id])
    render json: book, serializer: BookSerializer
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, serializer: BookSerializer, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: book, serializer: BookSerializer
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, tag_ids: [])
  end
end
