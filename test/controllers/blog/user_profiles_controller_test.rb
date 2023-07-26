require 'test_helper'

class Blog::UserProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = users(:admin)
  end

  test 'should get show' do
    get user_profile_url(@profile.name)
    assert_response :success
  end
end
