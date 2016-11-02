class LeagueController < ApplicationController
  def create
  end

  def submit
    team_names = []
    leauge_info = params['league']
    params['league'].each do |key, value|
      unless value.eql? ""
        team_names << Team.new({'name': value})
	team_names[-1].save
      end
    end
    redirect_to '/'
  end
end
