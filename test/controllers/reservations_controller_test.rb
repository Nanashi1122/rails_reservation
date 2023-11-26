require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get reservations_home_url
    assert_response :success
  end

  test "should get create" do
    get reservations_create_url
    assert_response :success
  end
end
