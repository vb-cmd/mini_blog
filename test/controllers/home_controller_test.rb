require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should visit home about" do
    get home_about_url
    assert_response :success
  end
end
