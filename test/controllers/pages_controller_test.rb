require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
  end

  test "should show page" do
    get page_url(@page)
    assert_response :success
  end
end
