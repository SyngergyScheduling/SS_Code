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
