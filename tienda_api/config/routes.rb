Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: { format: :json } do
        #autenticacion
        post 'auth/login', to: 'auth#login'

        #Usuarios
        resources :usuarios , only: [:index, :show, :create, :update, :destroy]
        #Categorias
        resources :categorias, only: [:index, :show, :create, :update, :destroy]
        #Productos
        resources :productos, only: [:index, :show, :create, :update, :destroy]
      
    end
  end
end
