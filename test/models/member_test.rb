require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "cannot create member without name" do
    member = Member.new({'teams_id': 0})
    assert_not member.save
  end
end
