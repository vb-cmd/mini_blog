require 'test_helper'

class Blog::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @post = posts(:one)
  end

  test 'should create a new comment' do
    body = 'create comment'

    post post_comments_url(@post),
         params: { comment: { body: } }

    assert_response :created
    assert_equal @post.comments.last.body, body
  end
end
