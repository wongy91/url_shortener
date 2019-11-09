Rails.application.routes.draw do
  root to: "urls#index", as: "root_locale"

  resources :urls, only: [:index, :new, :show, :create]
  # get 'urls/index'
  # get 'urls/new'
  get '/:id' => 'urls#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
