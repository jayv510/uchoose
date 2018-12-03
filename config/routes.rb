Rails.application.routes.draw do
  devise_for :mentors, controllers: { sessions: 'mentors/sessions', registrations: 'mentors/registrations' }
  devise_for :prospectives, controllers: { sessions: 'prospectives/sessions', registrations: 'prospectives/registrations'}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only:[:show, :edit, :update, :destroy]

  devise_scope :mentor do
  get 'mentors', to: 'mentors/sessions#index'
  get 'mentors/:id', to: 'mentors/sessions#show', as: :mentor
  get 'mentors/:id/edit', to: 'mentors/sessions#edit', as: :edit_mentor
  patch 'mentors/:id', to: 'mentors/sessions#update'
  end

  # resources :chats, only: [:show]
  get 'chats', to: 'chats#show'

  resources :tokens, only: [:create]

  resources :videotokens, only: [:create]

end
