class BookmarksController < ApplicationController
  def create
    bookmark_service = BookmarkService.new(current_user, Book.find(params[:book_id]))
    bookmark_service.create
    redirect_to Book.find(params[:book_id]), notice: "Book bookmarked."
  end

  def destroy
    bookmark_service = BookmarkService.new(current_user, Book.find(params[:book_id]))
    bookmark_service.destroy
    redirect_to books_path, notice: "Bookmark removed."
  end
end
