class TeamsController < ApplicationController
  def all
  end

  def create
    puts params
    team = Team.new(team_params)
    team.save
    render :json => {'teams_id': team.id}
  end

  def clear
    Team.all.each do |team|
      team.delete
    end
    Schedule.all.each do |sched|
      sched.delete
    end
  end

  private
  def team_params
    params.permit(:name)
  end
end
