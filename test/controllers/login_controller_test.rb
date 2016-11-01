require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "login as a referee" do 
    login_params = {
      'login': {
        'username': 'MyText',
        'password': 'secret'
      }
    }
    post '/login/submit', params: login_params
    assert_not session[:user_id].nil?, "User id session key not set"
    assert_not session[:login_fail], "session[:login_fail] is true"
    assert_redirected_to '/', 'could not login'
  end

  test "fail login as a referee with wrong username" do
    login_params = {
      'login': {
        'username': 'Batman',
        'password': 'secret'
      }
    }

    post '/login/submit', params: login_params

    assert session[:user_id].nil?
    assert session[:login_fail]
    assert_redirected_to '/login', 'should not have logged in'
  end

  test "login and logout as a referee" do
    login_params = {
      'login': {
        'username': 'MyText',
	'password': 'secret'
      }
    }
    post login_submit_url, params: login_params
    assert_not session[:user_id].nil?, "Login before logout failed."
    get login_logout_url
    assert session['id'].nil?
    assert_redirected_to '/login', 'not redirected to login page'
  end
end
