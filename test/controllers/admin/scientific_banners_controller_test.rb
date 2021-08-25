require 'test_helper'

class Admin::ScientificBannersControllerTest < ActionController::TestCase
  setup do
    @scientific_banner = scientific_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scientific_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scientific_banner" do
    assert_difference('ScientificBanner.count') do
      post :create, scientific_banner: { link: @scientific_banner.link, path: @scientific_banner.path, position: @scientific_banner.position }
    end

    assert_redirected_to admin_scientific_banner_path(assigns(:scientific_banner))
  end

  test "should show scientific_banner" do
    get :show, id: @scientific_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scientific_banner
    assert_response :success
  end

  test "should update scientific_banner" do
    patch :update, id: @scientific_banner, scientific_banner: { link: @scientific_banner.link, path: @scientific_banner.path, position: @scientific_banner.position }
    assert_redirected_to admin_scientific_banner_path(assigns(:scientific_banner))
  end

  test "should destroy scientific_banner" do
    assert_difference('ScientificBanner.count', -1) do
      delete :destroy, id: @scientific_banner
    end

    assert_redirected_to admin_scientific_banners_path
  end
end
