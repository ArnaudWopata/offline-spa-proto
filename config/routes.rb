GrpServer::Application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:index, :show]
    end
  end

  # Passthrough to frontend
  match '/' => 'home#index'

  root to: 'home#index'
end
