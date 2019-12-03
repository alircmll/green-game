Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  resources :categories, only: [:show]
  resources :users, only: [:show, :edit, :update] 
  resources :challenges, only: [:index, :show, :new, :create, :update] do
    resources :party_challenges, only: [:create]
  end
  
  resources :tips, only: [:index, :new, :create, :destroy] do
      resources :votes, only: [:create]
   end
  resources :quizzes, only: [:index, :show]

  # Creation de la partie Quiz a partir du quiz 
  resources :quizzes, only: [] do
    resources :party_quizzes, only: [:new]
  end

  # Réalisation de la partie à partir du party_quiz
  resources :party_quizzes, only: [] do
    # Boucles du Quiz
    resources :answers, only: [:new, :create]
  end

  resources :places, only: [:index]

end
