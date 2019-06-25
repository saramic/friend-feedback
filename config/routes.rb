Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :quizzes
    resources :invitations

    root to: "users#edit"
  end

  get "/*all" => "quizzes#index"
  root to: "quizzes#index"
end
