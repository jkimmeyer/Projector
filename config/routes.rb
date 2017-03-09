Rails.application.routes.draw do
  resources :projects do
    resources :milestones
  end

  root 'projects#index'

  get 'milestones/index'

  get 'milestones/edit'

  get 'projects/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
