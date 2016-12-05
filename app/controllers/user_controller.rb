class UserController < ApplicationController
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

  def user
    non_ref_redirect
    @sr = Referee.find_by_id(session[:user_id]).level.eql? 1
  end

  def remove
    non_ref_redirect
  end

  def change_pass
    non_ref_redirect
    session['error'] ||= []
    if request.post?
      session['error'] = []
      repeat = false
      passwords = params['new_password']
      passwords.each do |key, value|
        if value.eql? ""
	  repeat =  true
	  session['error'] << "Error: empty field"
        end
      end

      ref = Referee.find_by_id(session[:user_id])
      unless ref.authenticate(passwords['old_password'])
        repeat = true
	session['error'] << "invalid password"
      end

      unless passwords['new_password1'] == passwords['new_password2']
        repeat = true
        session['error'] << "passwords do not match"
      end
      
      if repeat
        redirect_to '/user/change_pass'
      else
        puts "setting password"
        ref.password = passwords['new_password1']
	ref.save
        session['error'] = []
        redirect_to '/user'
      end
    end
  end

  def submit
    non_ref_redirect
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

  def non_ref_redirect
    if session.nil?
      redirect_to '/'
      return
    end
    if session[:user_id].nil?
      redirect_to '/'
      return
    end
    ref = Referee.find_by(id: session[:user_id])
    if ref.nil?
      redirect_to '/'
      return
    end
  end
end
