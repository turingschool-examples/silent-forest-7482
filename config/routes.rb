Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chefs/:id', to: 'chefs#show'
  # get '/movies/:id', to: 'movies#show'
  # patch 'movies/:id', to: 'movies#update'
end
