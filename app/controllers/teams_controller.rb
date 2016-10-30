class TeamsController < ApplicationController
  def all
  end

  def create
    puts params
    team = Team.new(team_params)
    team.save
    render :json => {'teams_id': team.id}
  end

  private
  def team_params
    params.permit(:name)
  end
end
