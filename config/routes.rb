Rails.application.routes.draw do
  # Books APIのエンドポイント
  resources :books, only: [:index, :show, :create, :update, :destroy]

  # # CategoriesとTagsは、必要に応じてネスト可能
  # resources :categories, only: [:index]
  # resources :tags, only: [:index]

  # # ホームやヘルスチェック用ルート
  # root to: "books#index" # ルートパスでBooksのリストを返す

  # # カスタムエンドポイント（必要に応じて追加）
  # get '/books/:id/reviews', to: 'books#reviews' # 特定の本に関連するレビューを取得する例
end
