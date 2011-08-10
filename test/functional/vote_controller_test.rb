require 'test_helper'

class VoteControllerTest < ActionController::TestCase
  test "should get cast" do
    get :cast
    assert_response :success
  end

end
