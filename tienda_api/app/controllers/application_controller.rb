class ApplicationController < ActionController::API

  def autenticar_usuario
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      @current_usuario = Usuario.find(decoded['usuario_id'])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: {error: 'No autorizado'}, status: :unauthorized
    end
  end
end
