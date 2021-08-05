Rails.application.routes.draw do
  root to: 'application#index'
  resources :offers
end
