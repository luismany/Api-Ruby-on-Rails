class Api::V1::UsuariosController < ApplicationController
  before_action :autenticar_usuario, only: [:index, :show]
  before_action :set_usuario, only: [:show, :update, :destroy]

  def index 
    usuarios = Usuario.all
    render json: usuarios, status: :ok
  end

  def show
    render json:@usuario
  end

  def create
    usuario= Usuario.new(usuario_params)
    if usuario.save
      render json: usuario, status: :created
    else
      render json: {errors: usuario.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    if @usuario.update(usuario_params)
      render json: @usuario, status: :ok
    else
      render json: {errors: @usuario.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
    return if @usuario
    render json: { error: 'Usuario no encontrado' }, status: :not_found
  end

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :password)
  end

end
