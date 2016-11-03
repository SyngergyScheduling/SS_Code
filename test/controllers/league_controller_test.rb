require 'test_helper'
require 'set'

class LeagueControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "create teams and league" do
    team_params = {
      'league': {
        'team1': 'Defenders',
        'team2': 'Avengers',
        'team3': 'Fantastic 4',
        'team4': 'Guardians of the Galaxy'
      }
    }
    post league_create_url, params: team_params
    assert_redirected_to '/', 'there was some error creating teams'
  end

  test 'cannot duplicate teams' do
    team_params = {
      'league': {
        'team1': 'Defenders',
        'team2': 'Avengers',
        'team3': 'Fantastic 4',
        'team4': 'Guardians of the Galaxy'
      }
    }
    post league_create_url, params: team_params
    post league_create_url, params: team_params
    assert_redirected_to league_create_url, 'there was some error creating teams'
  end

  #test 'scheduleing algorithm' do
    #list = [1,2,3,4,5,6,7,8,9,10]
    #matches = Set.new
    #schedule(list).each do |day|
      #day.each do |pair|
        #matches << pair
      #end
    #end
    #assert matches.size.eql? (n * (n-1)) / 2
  #end
end
