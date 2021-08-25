require 'test_helper'

class Admin::SettingsControllerTest < ActionController::TestCase
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post :create, setting: { address: @setting.address, banner_a: @setting.banner_a, banner_b: @setting.banner_b, logo: @setting.logo, oa_path: @setting.oa_path, qrcode: @setting.qrcode, tel: @setting.tel }
    end

    assert_redirected_to admin_setting_path(assigns(:setting))
  end

  test "should show setting" do
    get :show, id: @setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting
    assert_response :success
  end

  test "should update setting" do
    patch :update, id: @setting, setting: { address: @setting.address, banner_a: @setting.banner_a, banner_b: @setting.banner_b, logo: @setting.logo, oa_path: @setting.oa_path, qrcode: @setting.qrcode, tel: @setting.tel }
    assert_redirected_to admin_setting_path(assigns(:setting))
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete :destroy, id: @setting
    end

    assert_redirected_to admin_settings_path
  end
end
