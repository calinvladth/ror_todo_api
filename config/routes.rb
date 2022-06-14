Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { sessions: :sessions },
                 path_names: { sign_in: :login }
      resource :user, only: [:show, :update]
      resources :todos
    end
  end
end
