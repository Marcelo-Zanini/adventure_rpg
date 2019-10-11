Rails.application.routes.draw do
  devise_for :players
  root to: "home#index"
end
