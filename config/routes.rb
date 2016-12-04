Rails.application.routes.draw do
  get 'home/index', to: redirect('/')

  get '/login' => 'login#login'
  get '/login/logout' => 'login#logout', to: redirect('/login')
  post '/login/referee' => 'login#create'
  delete '/login/referee' => 'login#delete'
  post 'login/submit'

  get 'teams/all'
  post 'teams/create' => 'teams#create'
  post 'teams/member/create' => 'teams#add_member'
  get 'clearteams' => 'teams#clear'

  get '/team_scoring/teamScoring'
  post 'team_scoring/score'
  root 'home#index'

  get 'league/create'
  post 'league/create' => 'league#submit'
  get 'league/modify'
  post 'league/modify'
  get 'league/reschedule'
  post  'league/reschedule'
  
  get 'user/add'
  get 'user' => 'user#user'
  get 'user/remove'
  get 'user/change_pass'
  #get 'add_user/add'
  #post'add_user/add'
  #post 'add_user/submit'
  #post 'add_user/add/new' => 'add_user#add'

end
