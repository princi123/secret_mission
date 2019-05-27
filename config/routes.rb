Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
           :controllers  => {
             :registrations => 'registrations',
           }
  root to: 'home#index'


  resources :secret_codes do
  	collection  do
  		post :bulk_code
  	end
  end

end
