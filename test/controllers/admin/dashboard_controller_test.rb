require 'test_helper'
require_relative 'base_controller_test'

class Admin::DashboardControllerTest < Admin::BaseControllerTest
  test 'should get index' do
    get admin_url
    assert_response :success
  end

  test 'should get statistics' do
    get admin_statistics_url
    assert_response :success
  end
end
