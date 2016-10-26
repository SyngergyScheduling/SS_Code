Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index', to: redirect('/')
  get 'login/login'
  get 'teams/all'
  post 'login/submit'
  root 'home#index'
end
