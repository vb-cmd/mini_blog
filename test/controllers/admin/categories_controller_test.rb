require 'test_helper'
require_relative 'base_controller_test'

module Admin
  class CategoriesControllerTest < BaseControllerTest
    setup do
      @category = categories(:one)
    end

    test 'should get index' do
      get admin_categories_url
      assert_response :success
    end

    test 'should get posts' do
      get admin_category_posts_url(@category)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_category_url(@category)
      assert_response :success
    end

    test 'should get show' do
      get admin_category_url(@category)
      assert_response :success
    end

    test 'should update category' do
      title = 'Updated title'
      description = 'Updated description'

      patch admin_category_url(@category), params: { category: { title:, description: } }

      @category.reload

      assert_redirected_to admin_category_url(@category), notice: 'Category was successfully updated.'
      assert_equal title, @category.title
      assert_equal description, @category.description.body.to_plain_text
    end

    test 'should get new' do
      get new_admin_category_url
      assert_response :success
    end

    test 'should create category' do
      title = 'Created title'
      description = 'Created description'

      post admin_categories_url, params: { category: { title:, description: } }

      category = Category.last

      assert_redirected_to admin_category_url(category), notice: 'Category was successfully created.'
      assert_equal title, category.title
      assert_equal description, category.description.body.to_plain_text
    end

    test 'should destroy category' do
      delete admin_category_url(@category)

      assert_redirected_to admin_categories_url, notice: 'Category was successfully destroyed.'

      assert_raises ActiveRecord::RecordNotFound do
        Category.find(@category.id)
      end
    end
  end
end
