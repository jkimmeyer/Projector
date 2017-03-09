Rails.application.routes.draw do
  resources :projects do
    resources :milestones
  end

  root 'projects#index'

  get 'projects/milestones/index', to: 'milestones#index'

  get 'projects/milestones/:id', to: 'milestones#show'

  get 'projects/show/:id', to: 'projects#show'

  get 'projects/new', to:'projects#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
