require 'test_helper'

class MeetingNotificationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get notify" do
    get :notify
    assert_response :success
  end

end
