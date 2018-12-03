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

  # resources :chats, only: [:show]
  get 'chats', to: 'chats#show'

  resources :tokens, only: [:create]

  get '/mentors/:mentor_id/review_mentors/new', to: 'review_mentors#new', as: :review_mentors
  post '/mentors/:mentor_id/review_mentors/new', to: 'review_mentors#create'


#                Prefix  Verb  URI Pattern                              Controller#Action
# new_restaurant_review  GET   /restaurants/:restaurant_id/reviews/new  reviews#new
#    restaurant_reviews  POST  /restaurants/:restaurant_id/reviews      reviews#create

# get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

end
