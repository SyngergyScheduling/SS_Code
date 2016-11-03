class TeamScoringController < ApplicationController
  
  
  def teamScoring
  if session[:user_id].nil?
    redirect_to '/'
  end
  end

  def score
  end
end
