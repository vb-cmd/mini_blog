require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:two)
  end
  test 'should get new' do
    post post_comment_url(@post),
         params: { comment: { name: 'test', email: 'test@test.com', body: 'test' } }
    assert_response :created
    assert_equal @post.comments.count, 1
  end
end
