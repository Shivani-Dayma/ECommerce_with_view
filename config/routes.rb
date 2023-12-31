Rails.application.routes.draw do
  get 'users/sign_in', to: 'sessions#new'
  post 'authentication/login', to: 'authentication#login'
  get 'authentication/signout', to: 'authentication#signout'

  scope '/authentication' do
    resources :users
  end
resources :users do
  resources :products
end

  root to: "main#index"
  get 'main', to: 'main#home'

end
