Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chefs, only: [:show] do
    member do
      patch :remove_dish
    end
  end
end
