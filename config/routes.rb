Rails.application.routes.draw do
  resources :chefs, only: [:show] do
    resources :dishes, only: [:destroy]
  end
end
