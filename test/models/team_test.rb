require 'test_helper'

class TeamTest < ActiveSupport::TestCase
   test "should not save team without name" do
     team = Team.new
     assert_not team.save
   end

   test "create team" do
     team = Team.new({'name': 'Defenders'})
     assert team.save
   end
end
