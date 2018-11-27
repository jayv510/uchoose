Rails.application.routes.draw do
  devise_for :mentors, controllers: { sessions: 'mentors/sessions', registrations: 'mentors/registrations' }
  devise_for :prospectives
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only:[:show, :edit, :update, :destroy]

  devise_scope :mentor do
  get 'mentors', to: 'mentors/sessions#index'
  get 'mentor', to: 'mentors/sessions#new'
  get 'edit_mentor', to: 'mentors/sessions#edit'
  patch 'update_mentor', to: 'mentors/sessions#update'
  end

end
