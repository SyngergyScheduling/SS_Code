class LoginController < ApplicationController
  def login
    puts session[:login_fail]
    session[:login_fail] ||= false
  end

  def submit
    username = params['login']['username']
    password = params['login']['password']
    ref = Referee.find_by_username(username)
    if ref && ref.authenticate(password)
      session[:login_fail] = false
      session[:user_id] = ref.id
      redirect_to '/'
    else
      session[:login_fail] = true
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end

  def create
    referee = Referee.new(user_params)
    referee.save
    render :json => {'id': referee.id}
  end

  def delete
    Referee.find(params['id']).destroy
  end

  private def delete_params
    params.permit(:id)
  end

  private def user_params
    params.permit(:username, :password, :level)
  end
end
