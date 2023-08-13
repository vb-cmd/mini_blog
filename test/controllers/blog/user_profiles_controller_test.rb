require 'test_helper'

class Blog::UserProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = admin_users(:administrator)
  end

  test 'should get show' do
    get user_profile_url(@profile.name)
    assert_response :success
  end
end
