class ApplicationController < ActionController::API
  # 現在のユーザーを取得する
  def current_user
    token = extract_token_from_header
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
    auth_header&.split(' ')&.last
  end

  # トークンをデコード
  def decode_token(token)
    JWT.decode(token, ENV['JWT_SECRET_KEY'], true, algorithm: 'HS256')
  end
end
