require 'application_system_test_case'

class LikesToPostTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user)
    @post = posts(:one)
  end

  test 'make a like' do
    visit post_url(@post)

    likes_count = @post.likes_count

    assert_text "Likes: #{likes_count}"

    find(:xpath, './/div[1]/div[1]/ul/li[4]/div/a').click

    likes_count += 1

    assert_text "Likes: #{likes_count}"

    assert_equal @post.reload.likes_count, likes_count
  end
end
