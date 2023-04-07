require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "search post by title" do
    get search_url, params: { q: @post.title }
    assert_response :success
  end
end
