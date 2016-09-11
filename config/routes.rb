Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles, only: [:show] do
    resources :comments, only: [:create]
  end

  root controller: :landing, action: :index
end
