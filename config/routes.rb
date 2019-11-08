Rails.application.routes.draw do
  get 'urls/index'
  get 'urls/new'
  get 'urls/:id' => 'url#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
