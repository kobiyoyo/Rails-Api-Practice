Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
	namespace :api do
		namespace :v1 do
			resources :users
			resources :photos, only: [:index,:show,:create,:update] do
				resources :comments,only: [:create]
			end
		end
	end
end
