require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the category" do
    visit category_url(@category)
    assert_text @category.title
  end
end
