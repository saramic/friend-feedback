Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :quizzes
    resources :invitations

    root to: "users#edit"
  end

  root to: "quizzes#index"
end
