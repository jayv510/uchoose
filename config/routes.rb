Rails.application.routes.draw do
  devise_for :mentors, controllers: { sessions: 'mentors/sessions', registrations: 'mentors/registrations' }
  devise_for :prospectives, controllers: { sessions: 'prospectives/sessions', registrations: 'prospectives/registrations'}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :mentor do
  get 'mentors', to: 'mentors/sessions#index'
  get 'mentors/:id', to: 'mentors/sessions#show', as: :mentor
  get 'mentors/:id/edit', to: 'mentors/sessions#edit', as: :edit_mentor
  patch 'mentors/:id', to: 'mentors/sessions#update'
  end

  get '/mentors/:mentor_id/review_mentors/new', to: 'review_mentors#new', as: :review_mentors
  post '/mentors/:mentor_id/review_mentors/new', to: 'review_mentors#create'

  resources :tokens, only: [:create]
  resources :videotokens, only: [:create]
  resources :calldurations, only: [:create]
end
