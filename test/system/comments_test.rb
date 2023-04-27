require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:two)
    @comment = comments(:one)
  end

  test 'create a new comment' do
    equel_comments 0

    visit post_url(@post)

    assert_text 'Two posts'

    fill_in 'comment[name]', with: @comment.name
    fill_in 'comment[email]', with: @comment.email
    fill_in 'comment[body]', with: @comment.body
    click_on 'Leave a comment'

    assert_text 'Comment created!'

    equel_comments 1
  end

  private

  def equel_comments(quantity)
    assert_equal quantity, @post.comments.count
  end
end
