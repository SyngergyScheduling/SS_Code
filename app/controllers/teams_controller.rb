class TeamsController < ApplicationController
  def all
  end

  def create
    puts params
    team = Team.new(team_params)
    team.save
    render :json => {'teams_id': team.id}
  end

  def add_member
    member = Member.new(member_params)
    member.save
  end

  private
  def team_params
    params.permit(:name)
  end

  private
  def member_params
    params.permit(:teams_id, :name)
  end
end
