Rails.application.routes.draw do
  devise_for :mentors
  devise_for :prospectives
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only:[:show, :edit, :update, :destroy]
end
