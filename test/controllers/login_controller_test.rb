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
    # When logged in the user will be redirected
    # to the home page
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

    # When login fails the user is redirected to
    # the login page
    assert_redirected_to '/login', 'should not have logged in'
  end
end
