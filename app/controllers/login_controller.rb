class LoginController < ApplicationController
  def login
    @fail ||= false
  end

  def submit
    username = params['login']['username']
    password = params['login']['password']
    ref = Referee.find_by_username(username)
    if ref && ref.authenticate(password)
      session[:user_id] = ref.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def create
    puts params[:id]
  end
end
