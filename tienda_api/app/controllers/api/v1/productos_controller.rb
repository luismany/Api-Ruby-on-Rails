class Api::V1::ProductosController < ApplicationController
before_action :autenticar_usuario, only: [ :create, :update, :destroy ]
before_action :set_producto, only: [ :show, :update, :destroy ]

  def index
    @productos = Producto.all
    render json: @productos.to_json(only: [ :id, :nombre, :descripcion, :precio ], include: { categoria: { only: [ :id, :nombre ] } })
  end


  def show
    # Incluir detalles de la categoría asociada
    render json: @producto.to_json(only: [ :id, :nombre, :descripcion, :precio ], include: { categoria: { only: [ :id, :nombre ] } })
  end

  def create
    @producto = Producto.new(producto_params)
    if @producto.save
      render json: @producto, status: :created
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  def update
    if @producto.update(producto_params)
      render json: @producto
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @producto.destroy
    head :no_content
  end

  private
  def producto_params
    params.require(:producto).permit(:nombre, :descripcion, :precio, :categoria_id)
  end

  def set_producto
    @producto = Producto.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render json: { error: "Producto no encontrado" }, status: :not_found
  end
end
