require "test_helper"

class Blog::PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
  end

  test "should get show" do
    get page_url(@page)

    assert_response :success
  end
end
