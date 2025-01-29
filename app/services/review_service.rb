class ReviewService
  attr_reader :review, :errors

  def initialize(book, user, params = nil)
    @book = book
    @user = user
    @params = params
    @review = nil
    @errors = []
  end

  # 書籍に関連するレビューを取得
  def index_for_book
    reviews = @book.reviews
    Rails.logger.debug("Reviews found: #{reviews.inspect}")
    reviews
  end

  # レビューを作成
  def create
    return error('User must be logged in') unless @user
    return error('Book not found') unless @book

    @review = @book.reviews.new(@params.merge(user: @user))
    if @review.save
      true
    else
      @errors = @review.errors.full_messages
      false
    end
  end

  private

  def error(message)
    @errors << message
    false
  end
end
