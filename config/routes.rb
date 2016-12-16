Rails.application.routes.draw do
 
	resources :users, except: [:destroy] 
	resources :sessions, only: [:create, :destroy]
	root 'users#index'
end
