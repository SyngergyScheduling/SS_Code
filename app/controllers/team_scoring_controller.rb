class TeamScoringController < ApplicationController
  
  
  def teamScoring
    if session[:user_id].nil?
      redirect_to '/'
    end
    cookies[:team1] = params['id1']
    cookies[:team2] = params['id2']
        cookies[:match] = params['match']
    @team1 = Team.find_by(id: params['id1'])
    @team2 = Team.find_by(id: params['id2'])
    @match = Schedule.find_by(id: params['match'])
  end

  def score
    @team1 = Team.find_by(id: cookies[:team1])
    @team2 = Team.find_by(id: cookies[:team2])
        @match = Schedule.find_by(id: cookies[:match])
    fields = ['Style', 'Presentation', 'Understanding', 'Response']
    team1 = 0
    team2 = 0
    fields.each do |field|
          
      team1 += params['scoring']["Team1-#{field}"].to_i
      team2 += params['scoring']["Team2-#{field}"].to_i
    end
        
        @match.update(team1_style: params['scoring']["Team1-#{'Style'}"].to_i)
        @match.update(team2_style: params['scoring']["Team2-#{'Style'}"].to_i)
        @match.update(team1_presentation: params['scoring']["Team1-#{'Presentation'}"].to_i)
        @match.update(team2_presentation: params['scoring']["Team2-#{'Presentation'}"].to_i)
        @match.update(team1_understanding: params['scoring']["Team1-#{'Understanding'}"].to_i)
        @match.update(team2_understanding: params['scoring']["Team2-#{'Understanding'}"].to_i)
        @match.update(team1_response: params['scoring']["Team1-#{'Response'}"].to_i)
        @match.update(team2_response: params['scoring']["Team2-#{'Response'}"].to_i)
        
    @match.update(team1_score: team1)
    @match.update(team2_score: team2)
    @match.save
        @match.update(previously_scored: 1)
    redirect_to teams_all_url
  end
end
