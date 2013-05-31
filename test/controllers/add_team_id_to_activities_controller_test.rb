require 'test_helper'

class AddTeamIdToActivitiesControllerTest < ActionController::TestCase
  test "should get team_id:integer" do
    get :team_id:integer
    assert_response :success
  end

end
