Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      origins 'http://localhost:3000' # 開発環境のフロントエンドURL
    end

    # 末尾にスラッシュないこと確認!!!!!!
    if Rails.env.production?
      origins 'https://tech-book-review-frontend.vercel.app' # 本番環境のフロントエンドURL
    end


    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      expose: ['Authorization']  # Authorizationヘッダーを公開
  end
end
