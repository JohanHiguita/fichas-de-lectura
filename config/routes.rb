Rails.application.routes.draw do
  get 'autors/create'
  get 'autors/edit'
  get 'autors/update'
	devise_for :users

	root to: "books#index"
	resources :books 
	resources :autors

end
