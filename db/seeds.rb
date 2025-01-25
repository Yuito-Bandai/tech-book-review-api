# Clear existing data to avoid duplication
Bookmark.destroy_all
Review.destroy_all
Book.destroy_all
BooksAuthor.destroy_all
Author.destroy_all
User.destroy_all
Like.destroy_all
ReadingStatus.destroy_all

# Users
puts "Creating users..."
users = User.create!([
  { username: "alice", email: "alice@example.com", password: "password1234" },
  { username: "bob", email: "bob@example.com", password: "password1235" },
  { username: "charlie", email: "charlie@example.com", password: "password1236" }
])

# Authors
puts "Creating authors..."
authors = Author.create!([
  { name: "Russ Olsen" },
  { name: "Douglas Crockford" },
  { name: "Steve Krug" }
])

# Books
puts "Creating books..."
books = Book.create!([
  { title: "Eloquent Ruby", published_date: "2011-02-15", image_link: "https://example.com/eloquent_ruby.jpg", info_link: "https://example.com/eloquent_ruby", isbn: "978-0321584100" },
  { title: "JavaScript: The Good Parts", published_date: "2008-05-01", image_link: "https://example.com/js_good_parts.jpg", info_link: "https://example.com/js_good_parts", isbn: "978-0596517748" },
  { title: "Don't Make Me Think", published_date: "2000-08-01", image_link: "https://example.com/dont_make_me_think.jpg", info_link: "https://example.com/dont_make_me_think", isbn: "978-0321344754" }
])

# Associate authors with books (ensure no duplicate associations)
puts "Associating authors with books..."
books.each_with_index do |book, index|
  BooksAuthor.find_or_create_by!(book_id: book.id, author_id: authors[index].id)
end

# Reviews
puts "Creating reviews..."
reviews = Review.create!([
  { rating: 5, content: "Ruby エンジニアは必ず読むべき！", book: books[0], user: users[0] },
  { rating: 4, content: "JavaScriptの学習者にとってめっちゃいい", book: books[1], user: users[1] },
  { rating: 5, content: "とても分かりやすかった", book: books[2], user: users[2] }
])

# Bookmarks
puts "Creating bookmarks..."
Bookmark.create!([
  { user: users[0], book: books[0] },
  { user: users[1], book: books[1] },
  { user: users[2], book: books[2] }
])

# Reading Statuses
puts "Creating reading statuses..."
ReadingStatus.create!([
  { user: users[0], book: books[0], status: "reading", started_at: "2025-01-01", finished_at: nil },
  { user: users[1], book: books[1], status: "completed", started_at: "2025-01-02", finished_at: "2025-01-10" },
  { user: users[2], book: books[2], status: "completed", started_at: "2025-01-03", finished_at: "2025-01-08" }
])

# Likes
puts "Creating likes..."
Like.create!([
  { user: users[0], book: books[1] },
  { user: users[1], book: books[2] },
  { user: users[2], book: books[0] }
])

puts "Seed data successfully created!"
