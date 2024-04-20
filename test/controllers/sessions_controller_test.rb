require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get guest_sign_in" do
    get sessions_guest_sign_in_url
    assert_response :success
  end
end
