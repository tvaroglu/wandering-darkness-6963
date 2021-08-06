Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :plots, only: [:index, :show]
  resources :gardens, only: [:index, :show]

  resources :garden_beds, only: [:create, :destroy]

end
