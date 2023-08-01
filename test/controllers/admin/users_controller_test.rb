require 'test_helper'
require_relative 'base_controller_test'

class Admin::UsersControllerTest < Admin::BaseControllerTest
  setup do
    @admin = users(:admin)
  end

  test 'should get index' do
    get admin_users_url
    assert_response :success
  end

  test 'should get user comments' do
    get admin_user_comments_url(@admin)
    assert_response :success
  end

  test 'should get user posts' do
    get admin_user_comments_url(@admin)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_user_url(@admin)
    assert_response :success
  end

  test 'should get show' do
    get admin_user_url(@admin)
    assert_response :success
  end

  test 'should update user' do
    body = 'Updated body'

    patch admin_user_url(@admin), params: { user: { body: } }

    @admin.reload

    assert_redirected_to admin_user_url(@admin), notice: 'User was successfully updated.'
    assert_equal body, @admin.body
  end

  test 'should get new' do
    get new_admin_user_url
    assert_response :success
  end

  test 'should create user' do
    email = 'user_email@example.com'
    password = 'password'
    password_confirmation = 'password'
    body = 'Created body'
    avatar = fixture_file_upload('avatar.png', 'image/png')
    name = 'super_user'
    role = 'admin'

    post admin_users_url,
         params: {
           user: { email:,
                   body:,
                   password:,
                   password_confirmation:,
                   avatar:,
                   name:,
                   role: }
         }

    user = User.last

    assert_redirected_to admin_user_url(user),
                         notice: 'User was successfully created.'
    assert_equal body, user.body
    assert_equal email, user.email
    assert_match(/#{user.avatar.name}/, avatar.original_filename)
    assert_equal name, user.name
    assert_equal role, user.role
  end

  test 'should destroy user' do
    @user = users(:user)
    delete admin_user_url(@user)

    assert_redirected_to admin_users_url,
                         notice: 'User was successfully destroyed.'
    assert_raises ActiveRecord::RecordNotFound do
      User.find(@user.id)
    end
  end
end
