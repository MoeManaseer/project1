Rails.application.routes.draw do
root 'posts#index'
get 'login', to: 'users#new'
post 'login', to: 'users#create'
delete 'logout', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
