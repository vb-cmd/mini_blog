require 'test_helper'
require_relative 'base_controller_test'

class Admin::PagesControllerTest < Admin::BaseControllerTest
  setup do
    @page = pages(:one)
  end

  test 'should get index' do
    get admin_pages_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_page_url(@page)
    assert_response :success
  end

  test 'should get show' do
    get admin_page_url(@page)
    assert_response :success
  end

  test 'should update page' do
    body = 'Updated body'

    patch admin_page_url(@page), params: { page: { body: } }

    @page.reload

    assert_redirected_to admin_page_url(@page),
                         notice: 'Page was successfully updated.'
    assert_equal body, @page.body.to_plain_text
  end

  test 'should get new' do
    get new_admin_page_url
    assert_response :success
  end

  test 'should create page' do
    body = 'Created body'
    title = 'Created title'
    published = true
    meta_title = 'Created meta title'
    meta_description = 'Created meta description'
    meta_keywords = 'Created meta keywords'

    post admin_pages_url,
         params: {
           page: { body:,
                   title:,
                   published:,
                   meta_title:,
                   meta_description:,
                   meta_keywords: }
         }

    page = Page.last

    assert_redirected_to admin_page_url(page),
                         notice: 'Page was successfully created.'
    assert_equal body, page.body.to_plain_text
    assert_equal title, page.title
    assert_equal published, page.published
    assert_equal meta_title, page.meta_title
    assert_equal meta_description, page.meta_description
    assert_equal meta_keywords, page.meta_keywords
  end

  test 'should destroy page' do
    delete admin_page_url(@page)

    assert_redirected_to admin_pages_url,
                         notice: 'Page was successfully destroyed.'
    assert_raises ActiveRecord::RecordNotFound do
      Page.find(@page.id)
    end
  end
end
