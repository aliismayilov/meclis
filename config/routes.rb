Meclis::Application.routes.draw do
  get '/auth/failure'            => 'sessions#failure',
    as: :auth_failure
  get '/auth/:provider'          => 'sessions#create',
    as: :login
  get '/auth/:provider/callback' => 'sessions#create',
    as: :auth_callback
  get '/logout'                  => 'sessions#destroy',
    as: :logout

  resources :posts, only: [:index]
  root 'posts#index'
end
