require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get versions" do
    get :versions
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
