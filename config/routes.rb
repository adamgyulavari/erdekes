Erdekes::Application.routes.draw do
  devise_for :students
  devise_scope :student do
    providers = Regexp.union(OmniAuth::Builder.providers.map(&:to_s))

    match "/auth/:provider", to: "omniauth_callbacks#passthru",
                             constraints: { provider: providers },
                             as: :omniauth_authorize,
                             via: [:get, :post]

    match "/auth/:provider/callback", to: "omniauth_callbacks#callback",
                                      constraints: { provider: providers },
                                      as: :omniauth_callback,
                                      via: [:get, :post]
  end
  devise_for :teachers

  namespace :admin do
    resources :courses
    resources :sections,  only: [:show, :new, :edit, :create, :update, :destroy]
    resources :lessons,   only: [:new, :edit, :create, :update, :destroy]
    resources :missions,  only: [:show, :new, :edit, :create, :update, :destroy]
    resources :solutions, only: [:new, :edit, :create, :update, :destroy] do
      get :result, on: :member
    end

    root 'courses#index'
  end

  resources :lessons, only: [:show]
  resources :missions, only: [:show]
  resources :profiles, only: [:edit, :update]
  resources :solutions, only: [:new, :create, :edit, :update]

  get 'console', to: 'home#console'
  get 'enaplostatus', to: 'home#enaplo'

  root to: 'home#index'
end
