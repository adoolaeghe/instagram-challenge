Rails.application.routes.draw do
  devise_for :models
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments
    resources :likes
  end
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
