class SessionsController < ApplicationController
  require 'jwt'

  # ログイン
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      Rails.logger.info("トークンを生成しました: #{token}")

      render json: { status: 'success', message: 'Login successful', token: token, user: user }
    else
      render json: { status: 'error', message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # ログアウト
  def destroy
    render json: { status: 'ok', message: 'Logged out. Please delete the token on the client side.' }
  end

  private

  # JWTトークンのエンコード
  def encode_token(payload)
    payload[:exp] = 24.hours.from_now.to_i  # トークンの有効期限を24時間に設定
    JWT.encode(payload, ENV['JWT_SECRET_KEY'], 'HS256')  # credentialsからJWT秘密鍵を使用
  end
end
