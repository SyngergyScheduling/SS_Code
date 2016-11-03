class LeagueController < ApplicationController
  def create
    session['error'] ||= []
  end

  def submit
    teams = []
    team_ids = []
    leauge_info = params['league']
    puts params['league']
    session['error'] = []
    error = false
    count = 0
    params['league'].each do |key, value|
      if count.eql? 10
        render "Error!"
      end
      unless value.eql? ""
        teams << Team.new({'name': value})
	team_ids << teams[-1].id
        begin
	  teams[-1].save
	rescue  ActiveRecord::RecordNotUnique
	  session['error'] << "Team #{value} already exists"
	  error = true
	end
      end
    end
    if error
      redirect_to league_create_url
      return
    end
    session['error'] = nil
    redirect_to '/'
  end
end
