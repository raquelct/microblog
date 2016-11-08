Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create]
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/user/:username' => 'users#show', as: :user_profile, constraints: { username: /[^\/]+/ }
  get "/user/:username/follow" => 'users#follow', as: :follow_user, constraints: { username: /[^\/]+/ }
  get "/user/:username/unfollow" => 'users#unfollow', as: :unfollow_user, constraints: { username: /[^\/]+/ }

  resources :users, only: [:update] do
    collection do
      get "search"
    end
  end

  root to: 'home#index'


end
