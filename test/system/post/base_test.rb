require 'application_system_test_case'

class Post::BaseTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user)
    @post = posts(:one)
  end
end
