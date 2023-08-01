require_relative 'base_test'

class Post::CommentsTest < Post::BaseTest
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
