require 'test_helper'
require_relative 'base_controller_test'

class Admin::CommentsControllerTest < Admin::BaseControllerTest
  setup do
    @comment = comments(:one)
  end

  test 'should get index' do
    get admin_comments_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_comment_url(@comment)
    assert_response :success
  end

  test 'should get show' do
    get admin_comment_url(@comment)
    assert_response :success
  end

  test 'should update comment' do
    body = 'Updated body'

    patch admin_comment_url(@comment), params: { comment: { body: } }

    @comment.reload

    assert_redirected_to admin_comment_url(@comment),
                         notice: 'Comment was successfully updated.'
    assert_equal body, @comment.body
  end

  test 'should get new' do
    get new_admin_comment_url
    assert_response :success
  end

  test 'should create comment' do
    body = 'Created body'
    published = true
    user_id = users(:admin).id
    post_id = posts(:one).id

    post admin_comments_url,
         params: {
           comment: { body:,
                      published:,
                      post_id:,
                      user_id: }
         }

    comment = Comment.last

    assert_redirected_to admin_comment_url(comment),
                         notice: 'Comment was successfully created.'
    assert_equal body, comment.body
    assert_equal published, comment.published
    assert_equal user_id, comment.user_id
    assert_equal post_id, comment.post_id
  end

  test 'should destroy comment' do
    delete admin_comment_url(@comment)

    assert_redirected_to admin_comments_url,
                         notice: 'Comment was successfully destroyed.'
    assert_raises ActiveRecord::RecordNotFound do
      Comment.find(@comment.id)
    end
  end
end
