class LeagueController < ApplicationController
  def create
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
    unless ref.level.eql? 1
      redirect_to '/'
      return
    end
    if Team.all.size > 0
      redirect_to league_modify_url
      return
    end

    session['error'] ||= []
  end

  def reschedule
    if request.post?
    end
  end

  def modify
    if request.post?
      Team.all.each_with_index do |team, i|
        unless team.name.eql? params['change']["team#{i}"]
          team.name = params['change']["team #{i}"]
	  team.save
	end
      end
      redirect_to teams_all_url
    end
  end

  def submit
    teams = []
    team_ids = []
    session['error'] = []
    error = false
    count = 0
    sd = params['start_date']
    year =  sd['start(1i)'].to_i
    month =  sd['start(2i)'].to_i
    day =  sd['start(3i)'].to_i
    start_date = DateTime.new(year, month, day)
    unless start_date.wday.eql? 6
      session['error'] << 'date is not a saturday'
      redirect_to league_create_url
      return
    end
    params['league'].each do |key, value|
      if count.eql? 10
        render "Error!"
      end
      unless value.eql? ""
        teams << Team.new('name': value)
        begin
	  teams[-1].save
	  team_ids << teams[-1].id
	rescue  ActiveRecord::RecordNotUnique
	  session['error'] << "Team #{value} already exists"
	  error = true
	end
      end
    end
    league_schedule = schedule(team_ids)
    league_schedule.each do |day|
      day.each do |pair|
        Schedule.new('team1_id': pair[0], 'team2_id': pair[1], date: start_date).save
      end
      start_date += 7
    end
    if error
      redirect_to league_create_url
      return
    end
    session['error'] = nil
    redirect_to '/'
  end
  def schedule(teams)
    days = []
    teams << nil if teams.size % 2 != 0
    (teams.size-1).times do
      day = []
      # When there are an odd number of items
      # we add one so the size is guaranteed to
      # be divisible by 2 by the definition of
      # even numbers.
      (teams.size / 2).times do |i|
        day << [teams[i], teams[-(i+1)]]
      end
      days << day
      teams.insert(0, teams.delete_at(teams.size-2))
    end
    return days
  end

end
