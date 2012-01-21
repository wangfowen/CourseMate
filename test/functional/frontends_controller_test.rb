require 'test_helper'

class FrontendsControllerTest < ActionController::TestCase
  setup do
    @frontend = frontends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frontends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frontend" do
    assert_difference('Frontend.count') do
      post :create, frontend: @frontend.attributes
    end

    assert_redirected_to frontend_path(assigns(:frontend))
  end

  test "should show frontend" do
    get :show, id: @frontend.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frontend.to_param
    assert_response :success
  end

  test "should update frontend" do
    put :update, id: @frontend.to_param, frontend: @frontend.attributes
    assert_redirected_to frontend_path(assigns(:frontend))
  end

  test "should destroy frontend" do
    assert_difference('Frontend.count', -1) do
      delete :destroy, id: @frontend.to_param
    end

    assert_redirected_to frontends_path
  end
end
