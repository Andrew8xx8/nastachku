Nastachku::Application.routes.draw do

  match "/404", :to => "web/errors#not_found"
  match "/500", :to => "web/errors#internal_server_error"

  root to: "web/welcome#index"

  mount Ckeditor::Engine => '/ckeditor'

  namespace :api do
    resources :companies
    resources :cities
  end
  # omniauth-facebook
  get '/auth/facebook/callback' => 'web/social_network#authorization'
  get '/auth/facebook/failure' => 'web/social_network#failure'

  scope :module => :web do
    resources :users, only: [:new, :create, :index]
    resources :pages, only: [:show]
    resource :session, only: [:new, :create, :destroy]
    resources :news, only: [:index]
    resource :remind_password, only: [:new, :create]


    resource :account, only: [:edit, :update] do
      scope :module => :account do
        resource :password, only: [:edit, :update]
      end
    end


    namespace :admin do
      resources :pages
      resources :news
      resources :users

      root to: "welcome#index"
    end
  end

end
