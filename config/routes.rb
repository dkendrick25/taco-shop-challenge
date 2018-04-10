Rails.application.routes.draw do
  root 'pages#index'
  
  resources :tacos, only: %i[index create destroy]
end
