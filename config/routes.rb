Rails.application.routes.draw do
 get '/', to: 'application#welcome'

 get '/chefs/:id', to: 'chefs#show', as: 'chef'
 delete '/dishes/:id', to: 'dishes#destroy'
end
