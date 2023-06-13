require "test_helper"

class Blog::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get blog_profiles_show_url
    assert_response :success
  end
end
