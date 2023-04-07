require 'test_helper'

class SitemapControllerTest < ActionDispatch::IntegrationTest
  test 'should get posts' do
    get sitemap_posts_url
    assert_response :success
  end
  test 'should get categories' do
    get sitemap_categories_url
    assert_response :success
  end
  test 'should get index' do
    get sitemap_url
    assert_response :success
  end
end
