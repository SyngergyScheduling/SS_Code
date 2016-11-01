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
end
