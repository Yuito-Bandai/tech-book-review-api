class BooksController < ApplicationController
  def index
    books = Book.all
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
    params.require(:book).permit(:title, :author, :category_id, tag_ids: [])
  end
end
