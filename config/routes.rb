Rails.application.routes.draw do
 get '/', to: 'application#welcome'

 get '/chefs/:id', to: 'chefs#show', as: 'chef'
end
