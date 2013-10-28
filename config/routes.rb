GrpServer::Application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:index, :show]
    end
  end

  # Passthrough to frontend
  match '/' => 'home#index'


  offline = Rack::Offline.configure :cache_interval => 1 do
    cache ActionController::Base.helpers.asset_path("application.css")
    cache ActionController::Base.helpers.asset_path("application.js")

    # cache other assets
    network "/"
  end

  match "/application.manifest" => offline

  root to: 'home#index'
end
