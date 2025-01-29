class ReviewsController < ApplicationController
  before_action :set_book, only: [:index, :create]

  # 特定の書籍に関連するレビューを取得 (GET /books/:book_id/reviews)
  def index
    review_service = ReviewService.new(@book, current_user)

    if @book
      reviews = review_service.index_for_book
      render json: reviews
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  # 新しいレビューを作成するアクション (POST /books/:book_id/reviews)
  def create
    review_service = ReviewService.new(@book, current_user, review_params)

    if review_service.create
      render json: { message: 'Review added successfully', review: review_service.review }, status: :created
    else
      render json: { error: 'Failed to create review', messages: review_service.errors }, status: :unprocessable_entity
    end
  end

  private

  # Strong Parameters
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_book
    @book = Book.find_by(id: params[:book_id])
    Rails.logger.debug("Book found: #{@book.inspect}")
  end
end
