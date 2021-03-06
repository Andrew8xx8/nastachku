Nastachku::Application.routes.draw do

  get "audits/index"

  match "/404", :to => "web/errors#not_found"
  match "/500", :to => "web/errors#internal_server_error"

  root to: "web/welcome#index"

  mount Ckeditor::Engine => '/ckeditor'

  # omniauth-facebook
  get '/auth/facebook/callback' => 'web/social_networks#authorization'
  get '/auth/facebook/failure' => 'web/social_networks#failure'

  namespace :api do
    resources :companies
    resources :cities

    resources :user_events do
      scope module: :user_events do
        resources :lecture_votings, only: [:create]
        resources :listener_votings, only: [:create]
      end
    end
  end

  scope :module => :web do
    resource :user, only: [] do
      get :activate
    end
    resources :users, only: [:new, :create, :index]

    resources :events, only: [ :index ]

    resource :schedule, only: [:show]

    resources :pages, only: [:show]
    resource :session, only: [:new, :create, :destroy]
    resources :news, only: [:index]
    resource :remind_password, only: [:new, :create]
    resources :user_events, only: [:index]

    resource :account, only: [:edit, :update] do
      scope :module => :account do
        resource :password, only: [:edit, :update]
        resources :events, only: [:new, :create]
      end
    end

    resource :social_networks, :only => [] do 
      get :authorization, :on => :member
    end

    resources :lectors, only: [ :index ]

    namespace :admin do
      resources :pages
      resources :news
      resources :users
      resources :audits, only: [ :index ]
      resources :topics
      resources :user_events do
        put :change_state
      end

      resources :events
      resources :workshops
      resources :halls
      resources :event_breaks

      root to: "welcome#index"
    end
  end

end
