require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end
end
