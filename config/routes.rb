Rails.application.routes.draw do

  devise_for :players
  root to: "home#index"

  resources :campaigns, only: %i[ index ]
end
