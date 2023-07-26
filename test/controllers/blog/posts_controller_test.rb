require 'test_helper'

class Blog::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get show' do
    get post_url(posts(:one))
    assert_response :success
  end
end
