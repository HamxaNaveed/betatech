Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get '/users/profile' => 'home#profile'
  get '/aboutus' => 'home#aboutus'
  get '/gallery' => 'home#gallery'


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/mycourse' => 'courses#mycourse'


  resource :course_categories
  resources :courses, except: [:destroy], param: :slug do
    resources :enrollments, only: [:new, :create], controller: 'course_enrollments'
  end
  resources :certificates, only: [:new, :show] do
    post :validate, on: :collection
  end
  resources :contacts, only: [:new, :create]
  resources :news, only: [:index, :show], param: :slug
  resources :blogs, param: :slug do
    resources :comments
  end
  resources :assignments, only: [:new, :create]

  get '*path', to: 'application#render_404'

end
