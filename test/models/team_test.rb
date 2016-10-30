require 'test_helper'

class TeamTest < ActiveSupport::TestCase
   test "should not save team without name" do
     team = Team.new
     assert_not team.save
   end

   test "create team" do
     team_data = {
       'name': 'Defender'
     }

     team = Team.new({'name': 'Defenders'})
     assert team.save
   end

   test "create team with captain" do
     team_data = {
       'name': 'Defenders',
       'captain': 'me'
     }

     team = Team.new(team_data)
     assert team.save
   end
end
