require 'test_helper'

class Blog::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user)
    @post = posts(:one)
  end

  test 'should create a new like' do
    patch post_likes_url(@post)

    assert_response :success
  end
end
