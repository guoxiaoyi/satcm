require 'test_helper'

class Admin::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get password" do
    get admin_account_password_url
    assert_response :success
  end

  test "should get edit" do
    get admin_account_edit_url
    assert_response :success
  end

end
