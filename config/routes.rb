Rails.application.routes.draw do

  resources :chefs, only: [:show] do
  end

  resources :dishes do
  end
end
