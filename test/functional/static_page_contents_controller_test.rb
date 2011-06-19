require 'test_helper'

class StaticPageContentsControllerTest < ActionController::TestCase
  setup do
    @static_page_content = static_page_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_page_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_page_content" do
    assert_difference('StaticPageContent.count') do
      post :create, :static_page_content => @static_page_content.attributes
    end

    assert_redirected_to static_page_content_path(assigns(:static_page_content))
  end

  test "should show static_page_content" do
    get :show, :id => @static_page_content.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @static_page_content.to_param
    assert_response :success
  end

  test "should update static_page_content" do
    put :update, :id => @static_page_content.to_param, :static_page_content => @static_page_content.attributes
    assert_redirected_to static_page_content_path(assigns(:static_page_content))
  end

  test "should destroy static_page_content" do
    assert_difference('StaticPageContent.count', -1) do
      delete :destroy, :id => @static_page_content.to_param
    end

    assert_redirected_to static_page_contents_path
  end
end
