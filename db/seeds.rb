# Clear existing data to avoid duplication
Bookmark.destroy_all
Review.destroy_all
Book.destroy_all
Tag.destroy_all
User.destroy_all

# Users
puts "Creating users..."
users = User.create!([
  { username: "alice", email: "alice@example.com", password: "password1234" },
  { username: "bob", email: "bob@example.com", password: "password1235" },
  { username: "charlie", email: "charlie@example.com", password: "password1236" }
])

# Tags
puts "Creating tags..."
tags = Tag.create!([
  { name: "Ruby" },
  { name: "JavaScript" },
  { name: "React" },
  { name: "Rails" },
  { name: "UX" }
])

# Books  rails import:books
puts "Creating books..."
books = Book.create!([
  { title: "Eloquent Ruby", author: "Russ Olsen", description: "A guide to writing idiomatic Ruby code.", published_at: "2011-02-15" },
  { title: "JavaScript: The Good Parts", author: "Douglas Crockford", description: "Essential JavaScript practices and features.", published_at: "2008-05-01" },
  { title: "Don't Make Me Think", author: "Steve Krug", description: "A common-sense approach to web usability.", published_at: "2000-08-01" }
])

# Associate tags with books
puts "Associating tags with books..."
books[0].tags << tags[0] << tags[3] # Eloquent Ruby: Ruby, Rails
books[1].tags << tags[1]           # JavaScript: JavaScript
books[2].tags << tags[4]           # Don't Make Me Think: UX

# Reviews
puts "Creating reviews..."
reviews = Review.create!([
  { rating: 5, content: "A must-read for Ruby developers!", book: books[0], user: users[0] },
  { rating: 4, content: "A great resource for learning JavaScript.", book: books[1], user: users[1] },
  { rating: 5, content: "Clear and concise advice on usability.", book: books[2], user: users[2] }
])

# Bookmarks
puts "Creating bookmarks..."
Bookmark.create!([
  { user: users[0], book: books[0] },
  { user: users[1], book: books[1] },
  { user: users[2], book: books[2] }
])

puts "Seed data successfully created!"
