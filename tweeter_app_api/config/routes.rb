Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets
  # Adding route with controller without data
  get '/meta', to: 'meta#about'
end
