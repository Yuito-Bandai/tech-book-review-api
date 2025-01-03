# lib/tasks/import_books.rake

namespace :import do
  desc "Import books from CSV"
  task books: :environment do
    require 'csv'
    filepath = Rails.root.join('data', 'final_book_dataset_kaggle2.csv')

    if File.exist?(filepath)
      CSV.foreach(filepath, headers: true) do |row|
        # 必要なカラムを指定して Book レコードを作成

        author = row['author'].presence || 'Unknown Author'

        Book.create!(
          title: row['title'],                     # 書籍名
          author: author,                          # 著者
          price: row['price'].to_f,                # 価格
          rating: row['rating'].to_f,              # レーティング
          pages: row['pages'].to_i,                # ページ数
          weight: row['weight'].to_f,              # 重量
          language: row['language'],               # 言語
          publisher: row['publisher'],             # 出版社
          isbn: row['isbn'],                       # ISBN
          amazon_url: row['amazon_url'],            # Amazon URL
        )
      end
      puts "Books imported successfully!"
    else
      puts "File not found: #{filepath}"
    end
  end
end
