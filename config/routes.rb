Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:create, :new]
  end

  root 'restaurants#index'
end
