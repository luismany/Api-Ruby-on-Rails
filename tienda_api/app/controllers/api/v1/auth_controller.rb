class Api::V1::AuthController < ApplicationController
 
  def login
    usuario= Usuario.find_by(email: params[:email])
    if usuario&.authenticate(params[:password])
      token = JWT.encode({usuario_id: usuario.id}, Rails.application.credentials.secret_key_base)
      render json: {token: token}, status: :ok
    else
      render json: {error: 'Credenciales invalidas'}, status: :unauthorized
    end
 end

end
