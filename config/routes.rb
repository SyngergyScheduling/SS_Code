Rails.application.routes.draw do
  get 'home/index', to: redirect('/')
  get '/login' => 'login#login'
  post '/login/referee' => 'login#create'
  delete '/login/referee' => 'login#delete'
  get 'teams/all'
  get '/team_scoring/teamScoring'
  post 'login/submit'
  root 'home#index'
end
