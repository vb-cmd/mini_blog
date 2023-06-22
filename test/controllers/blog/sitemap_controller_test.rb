require 'test_helper'

class Blog::SitemapControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get sitemap_url(:xml)
    
    assert_response :success
    assert_match /application\/xml/, response.headers['Content-Type']
  end
end
