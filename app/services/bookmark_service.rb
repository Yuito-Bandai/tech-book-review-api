class BookmarkService
  def initialize(user, book)
    @user = user
    @book = book
  end

  def create
    @user.bookmarks.create(book: @book)
  end

  def destroy
    @bookmark = @user.bookmarks.find_by(book_id: @book.id)
    @bookmark&.destroy
  end
end
