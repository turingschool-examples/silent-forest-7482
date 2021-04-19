Rails.application.routes.draw do
  resources :chefs, only: [:show]do
  end
end
