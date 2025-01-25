class LikesController < ApplicationController
  def create
    like_service = LikeService.new(current_user, Book.find(params[:book_id]))
    like_service.create
    redirect_to Book.find(params[:book_id]), notice: "Liked the book."
  end

  def destroy
    like_service = LikeService.new(current_user, Book.find(params[:book_id]))
    like_service.destroy
    redirect_to books_path, notice: "Like removed."
  end
end
