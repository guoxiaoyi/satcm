require 'test_helper'

class Admin::NavigationBarsControllerTest < ActionController::TestCase
  setup do
    @navigation_bar = navigation_bars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:navigation_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create navigation_bar" do
    assert_difference('NavigationBar.count') do
      post :create, navigation_bar: { custom_order: @navigation_bar.custom_order, name: @navigation_bar.name, url: @navigation_bar.url }
    end

    assert_redirected_to admin_navigation_bar_path(assigns(:navigation_bar))
  end

  test "should show navigation_bar" do
    get :show, id: @navigation_bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @navigation_bar
    assert_response :success
  end

  test "should update navigation_bar" do
    patch :update, id: @navigation_bar, navigation_bar: { custom_order: @navigation_bar.custom_order, name: @navigation_bar.name, url: @navigation_bar.url }
    assert_redirected_to admin_navigation_bar_path(assigns(:navigation_bar))
  end

  test "should destroy navigation_bar" do
    assert_difference('NavigationBar.count', -1) do
      delete :destroy, id: @navigation_bar
    end

    assert_redirected_to admin_navigation_bars_path
  end
end
