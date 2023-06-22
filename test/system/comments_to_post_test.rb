require 'application_system_test_case'

class CommentsToPostTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @post = posts(:one)
  end

  test 'create a new comment' do
    body = 'new comment'
    visit post_url(@post)

    assert_text 'Comment:'

    fill_in 'comment[body]', with: body
    click_on 'Leave a comment'

    assert_text 'Comment added successfully'

    assert_equal body, @post.reload.comments.last.body
  end
end
