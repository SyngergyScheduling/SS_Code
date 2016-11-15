class AddUserController < ApplicationController
def add
        unless session[:user_id].nil? 
          logged_in = true 
          unless Referee.find_by(id: session[:user_id]).nil?
      level = Referee.find_by(id: session[:user_id]).level
          end 
        end
        unless level.eql? 1
      redirect_to '/'
    end
    puts session[:username_taken]
        puts session[:created]
    session[:username_taken] ||= false
        session[:created] ||= false
end

def submit
        username = params['new']['username']
    password = params['new']['password']
    ref = Referee.find_by_username(username)
    if ref
      session[:username_taken] = true
      redirect_to '/add_user/add'
    else
          ref = Referee.new("username" => username, "password" => password, "level" => 0)
          ref.save
      session[:username_taken] = false
          session[:created] = true
      redirect_to '/add_user/add'
    end
end

end
