Rails.application.routes.draw do
  root to: "registers#index"
  resources :registers, only: [:new, :create, :index]
end
