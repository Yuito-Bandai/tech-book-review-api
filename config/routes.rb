Rails.application.routes.draw do
  root to: "books#index"

  resources :books do
    resources :reviews, only: [:index, :create]
    resources :tags, only: [:index]
  end

  resources :reviews, only: [:show, :update, :destroy]
  resources :users, only: [:create, :show] do
    resources :bookmarks, only: [:index, :create, :destroy]
  end

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # その他のカスタムルート
  get '/books/:book_id/reviews', to: 'reviews#index_for_book'
end
