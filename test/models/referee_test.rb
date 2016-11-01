require 'test_helper'

class RefereeTest < ActiveSupport::TestCase
  test "create a referee" do
    ref_params = {
      'username': 'DrStrange',
      'password': 'HolyHostsOfHoggoth',
      'level': 1
    }
    referee = Referee.new(ref_params)
    assert referee.save
  end

  test "cannot create referee without username" do
    ref_params = {
      'username': "",
      'password': 'p4ssword1!',
      'level': 0
    }
    referee = Referee.new(ref_params)
    assert_not referee.save
  end

  test "cannot create referee without password" do
    ref_params = {
      'username': 'Thor',
      'password': '',
      'level': 0
    }
    referee = Referee.new(ref_params)
    assert_not referee.save
  end

  test "default referee level is 0" do
    ref_params = {
      'username': 'IronMan',
      'password': 'p4ssword1!'
    }
    referee = Referee.new(ref_params)
    assert referee.save, "referee cannot be saved when no level given"
    assert referee.level.eql?(0), "referee level not default 0"
  end
end
