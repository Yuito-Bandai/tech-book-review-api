class ReviewsController < ApplicationController
  # 特定の書籍に関連するレビューを取得 (GET /books/:book_id/reviews)
  def index_for_book
    @book = Book.find_by(id: params[:book_id])

    if @book
      @reviews = @book.reviews
      render json: @reviews
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  # 新しいレビューを作成するアクション (POST /books/:book_id/reviews)
  def create
    @book = Book.find_by(id: params[:book_id])

    if @book
      if current_user.nil?
        render json: { error: 'User must be logged in' }, status: :unauthorized
        return
      end

      @review = @book.reviews.new(review_params)
      @review.user_id = current_user.id

      if @review.save
        render json: @review, status: :created
      else
        render json: { error: 'Failed to create review', messages: @review.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  private

  # Strong Parameters
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
