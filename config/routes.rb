Rails.application.routes.draw do
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  get '*unmatched_route', :to => 'errors#not_found'

  devise_for :users
  root to: 'categories#index'
  resources :categories, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :challenges, only: [:index, :show, :new, :create, :update] do
    resources :party_challenges, only: [:create]
  end
  resources :answers, only: [:new, :create]

  resources :tips, only: [:index, :new, :create, :destroy] do
      resources :votes, only: [:create]
   end
  resources :quizzes, only: [:show]
  resources :places, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
