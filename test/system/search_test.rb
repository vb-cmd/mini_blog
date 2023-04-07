require 'application_system_test_case'

class SearchTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the category' do
    visit search_url

    fill_in 'query[title_cont]', with: @post.title
    click_button 'Search'

    assert_text 'Quantity: 1'
    assert_text @post.title
  end
end
