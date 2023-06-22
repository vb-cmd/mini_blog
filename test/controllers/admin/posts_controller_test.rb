require 'test_helper'
require_relative 'base_controller_test'

class Admin::PostsControllerTest < Admin::BaseControllerTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get admin_posts_url
    assert_response :success
  end

  test 'should get post comments' do
    get admin_post_comments_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_post_url(@post)
    assert_response :success
  end

  test 'should get show' do
    get admin_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    body = 'Updated body'
    description = 'Created description'

    patch admin_post_url(@post), params: { post: { body:, description: } }

    @post.reload

    assert_redirected_to admin_post_url(@post), notice: 'Post was successfully updated.'
    assert_equal body, @post.body.to_plain_text
    assert_equal description, @post.description.to_plain_text
  end

  test 'should get new' do
    get new_admin_post_url
    assert_response :success
  end

  test 'should create post' do
    title = 'Created title'
    body = 'Created body'
    published = true
    description = 'Created description'
    comments_enabled = true
    meta_title = 'Created meta title'
    meta_description = 'Created meta description'
    meta_keywords = 'Created meta keywords'
    category_id = categories(:one).id

    post admin_posts_url,
         params: {
           post: { title:,
                   body:,
                   published:,
                   description:,
                   comments_enabled:,
                   category_id:,
                   meta_title:,
                   meta_description:,
                   meta_keywords: }
         }

    post = Post.last

    assert_redirected_to admin_post_url(post),
                         notice: 'Post was successfully created.'
    assert_equal body, post.body.to_plain_text
    assert_equal published, post.published
    assert_equal description, post.description.to_plain_text
    assert_equal comments_enabled, post.comments_enabled
    assert_equal meta_title, post.meta_title
    assert_equal meta_description, post.meta_description
    assert_equal meta_keywords, post.meta_keywords
    assert_equal category_id, post.category.id
    assert_equal title, post.title
  end

  test 'should destroy post' do
    delete admin_post_url(@post)

    assert_redirected_to admin_posts_url,
                         notice: 'Post was successfully destroyed.'
    assert_raises ActiveRecord::RecordNotFound do
      Post.find(@post.id)
    end
  end
end
