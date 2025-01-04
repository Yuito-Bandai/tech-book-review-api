class SessionsController < ApplicationController

  require 'jwt'

  # ログイン
  def create
    user = User.find_by(email: params[:email])

    # ユーザーが存在し、パスワードが一致する場合
    if user&.authenticate(params[:password])
      # JWTトークンを生成
      token = encode_token(user_id: user.id)
      Rails.logger.info("トークンを生成しました: #{token}")

      # トークンを返却
      render json: { status: :created, token: token, user: user }
    else
      # 認証エラー
      render json: { status: 401, message: "Invalid credentials" }
    end
  end

  # ログアウト
  def destroy
    # クライアント側でJWTトークンを削除するだけでセッション管理を行う
    render json: { status: :ok, message: "Logged out" }
  end

  private

  # JWTトークンのエンコード
  def encode_token(payload)
    # 'your_secret_key' を環境変数に変更してセキュリティを強化
    # JWTのペイロードに有効期限(exp)を設定することも重要
    payload[:exp] = 24.hours.from_now.to_i  # 24時間後にトークンが期限切れになる
    JWT.encode(payload, ENV['SECRET_KEY_BASE'], 'HS256')  # 環境変数から秘密鍵を取得
  end
end
