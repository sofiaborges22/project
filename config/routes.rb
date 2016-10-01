Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'

  resources :users, only: [:new, :show, :create] do
    resources :problems, only: [:index, :show, :new, :create, :destroy] do 
      member do 
        get :form_decision, :result_decision, :form_crossover
      end
      resources :decisions, only: [:index, :show, :new, :create] 
      resources :break_evens, only: [:index, :new, :show, :create, :destroy]
      resources :crossovers, only: [:index, :new, :show, :create]
    end
  end
  
  resources :decisions, only: [:destroy]
  resources :crossovers, only: [:destroy]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


end
