class LikeService
  def initialize(user, book)
    @user = user
    @book = book
  end

  def create
    @user.likes.create(book: @book)
  end

  def destroy
    @like = @user.likes.find_by(book_id: @book.id)
    @like&.destroy
  end
end
