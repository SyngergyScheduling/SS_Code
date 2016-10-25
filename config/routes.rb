Rails.application.routes.draw do
  get 'home/index', to: redirect('/')
  get '/login' => 'login#login'
  get 'teams/all'
  post 'login/submit'
  root 'home#index'
end
