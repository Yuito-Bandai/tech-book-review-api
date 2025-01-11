Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      origins 'http://localhost:3000' # 開発環境のフロントエンドURL
    end

    if Rails.env.production?
      origins 'https://tech-book-review-frontend-bandais-projects.vercel.app' # 本番環境のフロントエンドURL
    end


    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
