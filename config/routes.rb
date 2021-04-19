Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chefs/:id', to: 'chefs#show'

  delete '/chefs/:id/dishes/:dish_id', to: 'chefs#destroy'

end
