class ReadingStatusesController < ApplicationController
  def create
    reading_status_service = ReadingStatusService.new(
      current_user,
      Book.find(params[:book_id]),
      params[:status],
      params[:started_at],
      params[:finished_at]
    )
    reading_status_service.update_status
    redirect_to Book.find(params[:book_id]), notice: "Reading status updated."
  end
end
