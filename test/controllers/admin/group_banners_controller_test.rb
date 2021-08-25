require 'test_helper'

class Admin::GroupBannersControllerTest < ActionController::TestCase
  setup do
    @group_banner = group_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_banner" do
    assert_difference('GroupBanner.count') do
      post :create, group_banner: { link: @group_banner.link, path: @group_banner.path, position: @group_banner.position }
    end

    assert_redirected_to admin_group_banner_path(assigns(:group_banner))
  end

  test "should show group_banner" do
    get :show, id: @group_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_banner
    assert_response :success
  end

  test "should update group_banner" do
    patch :update, id: @group_banner, group_banner: { link: @group_banner.link, path: @group_banner.path, position: @group_banner.position }
    assert_redirected_to admin_group_banner_path(assigns(:group_banner))
  end

  test "should destroy group_banner" do
    assert_difference('GroupBanner.count', -1) do
      delete :destroy, id: @group_banner
    end

    assert_redirected_to admin_group_banners_path
  end
end
