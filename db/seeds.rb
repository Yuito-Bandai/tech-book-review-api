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
  { name: "ミック" },
  { name: "松尾 正信" },
  { name: "山田祥寛" }
])

# Books
puts "Creating books..."
books = Book.create!([
  {
    id: "76pxDwAAQBAJ",
    title: "達人に学ぶSQL徹底指南書 第2版 初級者で終わりたくないあなたへ",
    published_date: "2018-10-11",
    publisher: "翔泳社",
    isbn: "9784798157832",
    image_link: "http://books.google.com/books/content?id=76pxDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
    info_link: "https://play.google.com/store/books/details?id=76pxDwAAQBAJ&source=gbs_api",
    description: "SQLを扱うエンジニア必携のロングセラー、10年ぶりの改訂! …(省略)… SQLの原理や背景も詳しく解説。",
  },
  {
    id: "9SOJEAAAQBAJ",
    title: "PythonプログラミングABC",
    published_date: "2022-09-16",
    publisher: "近代科学社",
    isbn: "9784764906426",
    image_link: "http://books.google.com/books/content?id=9SOJEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
    info_link: "https://play.google.com/store/books/details?id=9SOJEAAAQBAJ&source=gbs_api",
    description: "【Pythonプログラミングの“入門の入り口”になる教科書！】 …(省略)… Python入門者に最適な一冊。",
  },
  {
    id: "iLrrDwAAQBAJ",
    title: "独習Python",
    published_date: "2020-06-22",
    publisher: "翔泳社",
    isbn: "9784798163642",
    image_link: "http://books.google.com/books/content?id=iLrrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
    info_link: "http://books.google.co.jp/books?id=iLrrDwAAQBAJ&dq=intitle:python&hl=&source=gbs_api",
    description: "手を動かしておぼえるPythonプログラミング ――独学に最適な“標準教科書” …(省略)… 初学者から再入門者までおすすめの一冊。",
  }
])

# Associate authors with books
puts "Associating authors with books..."
books.each_with_index do |book, index|
  # Using book.id and author.id to associate
  BooksAuthor.find_or_create_by!(book_id: book.id, author_id: authors[index].id)
end

# Reviews
puts "Creating reviews..."
reviews = Review.create!([
  { rating: 5, content: "SQLの基礎から応用まで幅広く学べる良書", book: books[0], user: users[0] },
  { rating: 4, content: "Python の基礎がしっかり学べる", book: books[1], user: users[1] },
  { rating: 5, content: "独習に最適な Python 本", book: books[2], user: users[2] }
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
