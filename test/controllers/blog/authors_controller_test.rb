require 'test_helper'

class Blog::AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = admin_users(:administrator)
  end

  test 'should get show' do
    get author_url(@author.name)
    assert_response :success
  end
end
