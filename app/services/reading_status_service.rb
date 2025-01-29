class ReadingStatusService
  def initialize(user, book, status, started_at = nil, finished_at = nil)
    @user = user
    @book = book
    @status = status
    @started_at = started_at
    @finished_at = finished_at
  end

  def update_status
    @user.reading_statuses.create(
      book: @book,
      status: @status,
      started_at: @started_at,
      finished_at: @finished_at
    )
  end
end
