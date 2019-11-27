Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  resources :categories, only: [:show]
  resources :users, only: [:show]
  resources :challenges, only: [:index, :show, :new, :create, :update] do
    resources :party_challenges, only: [:create]
  end
  resources :tips, only: [:index, :new, :create, :destroy] do
      resources :votes, only: [:create]
   end
  resources :options, only: [] do
    resources :answers, only: [:new, :create]
  end
  resources :quizzes, only: [:show]
  resources :places, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
