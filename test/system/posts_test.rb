require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the post" do
    visit posts_url(@post)
    assert_text @post.title
  end
end
