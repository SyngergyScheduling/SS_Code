class ApplicationController < ActionController::Base
  # This is temporary for right now.
  # TODO: change null_session to :exception if you
  # get the auth tokens working.
  protect_from_forgery with: :null_session
end
