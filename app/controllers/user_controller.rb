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
    session[:created] ||= false
    session[:error] ||= []
    if request.post?
      session[:error] = []
      repeat = false
      non_ref_redirect
      username = params['new']['username']
      password = params['new']['password']
      password2 = params['new']['password2']
      ref = Referee.find_by_username(username)
      if username.eql? "" or password.eql? ""
        repeat = true
	session[:error] << "blank text box"
      end
      unless password == password2
        repeat = true
	session[:error] << "passwords do not match"
      end
      if ref
        repeat = true
        session[:error] << "Username already exists"
      end
      if repeat
        puts 'here'
        redirect_to 'user/add'
      else
        level = params['level']['user_level'].to_i
	puts level
        ref = Referee.new("username" => username, "password" => password, "level" => level)
        ref.save
	session[:error] = ['user created successfully']
        redirect_to '/user/add'
      end
    end
  end

  def user
    non_ref_redirect
    session[:error] = []
    @sr = Referee.find_by_id(session[:user_id]).level.eql? 1
  end

  def remove
    non_ref_redirect
    if request.post?
      params['remove'].each do |key, value|
        puts 'here'
        if value.eql? '1'
	  Referee.find_by(id: key).destroy
	end
      end
      redirect_to '/user'
    end
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
