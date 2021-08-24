require 'test_helper'

class Admin::SwipersControllerTest < ActionController::TestCase
  setup do
    @swiper = swipers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swipers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swiper" do
    assert_difference('Swiper.count') do
      post :create, swiper: { link: @swiper.link, position: @swiper.position, title: @swiper.title, url: @swiper.url }
    end

    assert_redirected_to admin_swiper_path(assigns(:swiper))
  end

  test "should show swiper" do
    get :show, id: @swiper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swiper
    assert_response :success
  end

  test "should update swiper" do
    patch :update, id: @swiper, swiper: { link: @swiper.link, position: @swiper.position, title: @swiper.title, url: @swiper.url }
    assert_redirected_to admin_swiper_path(assigns(:swiper))
  end

  test "should destroy swiper" do
    assert_difference('Swiper.count', -1) do
      delete :destroy, id: @swiper
    end

    assert_redirected_to admin_swipers_path
  end
end
