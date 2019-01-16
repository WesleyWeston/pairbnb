require 'test_helper'

class NameControllerTest < ActionDispatch::IntegrationTest
  test "should get bookings" do
    get name_bookings_url
    assert_response :success
  end

end
