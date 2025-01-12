class ApplicationController < ActionController::API
  before_action :authenticate_user!

  # 現在のユーザーを取得する
  def current_user
    token = extract_token_from_header # ヘッダーからトークンを取得してる
    Rails.logger.info "Authorization token: #{token}" if token  # トークンが渡されている場合にログ出力

    return nil unless token

    begin
      decoded_token = decode_token(token)
      Rails.logger.info "Decoded token: #{decoded_token}" if decoded_token  # デコード後のトークン内容をログ出力
      user_id = decoded_token[0]['user_id']
      @current_user ||= User.find_by(id: user_id)
    rescue JWT::DecodeError => e
      Rails.logger.error "JWT Decode Error: #{e.message}"  # エラー詳細をログに出力
      nil
    end
  end

  private

  # ヘッダーからトークンを抽出
  def extract_token_from_header
    auth_header = request.headers['Authorization']
    Rails.logger.info "Authorization header: #{auth_header}"  # ヘッダー内容をログ出力
    auth_header&.split(' ')&.last
  end

  # トークンをデコード
  def decode_token(token)
    Rails.logger.info "Attempting to decode token: #{token}"
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    Rails.logger.info "Decoded token: #{decoded_token}"
    decoded_token
  end

  # ユーザー認証を行う
  def authenticate_user!
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
