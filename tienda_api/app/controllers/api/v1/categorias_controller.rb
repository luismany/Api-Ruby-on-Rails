class Api::V1::CategoriasController < ApplicationController
  before_action :autenticar_usuario, only: [:create, :update, :destroy]
  before_action :set_categoria, only: [:show, :update, :destroy]

  def index
    @categorias = Categoria.all
    render json: @categorias
  end

  def show
   render json: categoria
  end

  def create

   @categoria = Categoria.new(categoria_params)
   if @categoria.save
     render json: @categoria, status: :created
   else
     render json: @categoria.errors, status: :unprocessable_entity
   end
  end

  def update
    if @categoria.update(categoria_params)
      render json: @categoria
    else
      render json: @categoria.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @categoria.destroy
    if @categoria.destroyed?
      render json: { message: 'Categoría eliminada con éxito' }, status: :ok
    else
      render json: { error: 'Error al eliminar la categoría' }, status: :unprocessable_entity
    end 
  end

  private
  def categoria_params
    params.require(:categoria).permit(:nombre)
  end

  def set_categoria
    @categoria = Categoria.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Categoría no encontrada' }, status: :not_found
  end



end
