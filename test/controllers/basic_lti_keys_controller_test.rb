require 'test_helper'

class BasicLtiKeysControllerTest < ActionController::TestCase
  setup do
    @basic_lti_key = basic_lti_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_lti_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_lti_key" do
    assert_difference('BasicLtiKey.count') do
      post :create, basic_lti_key: { body: @basic_lti_key.body, title: @basic_lti_key.title }
    end

    assert_redirected_to basic_lti_key_path(assigns(:basic_lti_key))
  end

  test "should show basic_lti_key" do
    get :show, id: @basic_lti_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_lti_key
    assert_response :success
  end

  test "should update basic_lti_key" do
    patch :update, id: @basic_lti_key, basic_lti_key: { body: @basic_lti_key.body, title: @basic_lti_key.title }
    assert_redirected_to basic_lti_key_path(assigns(:basic_lti_key))
  end

  test "should destroy basic_lti_key" do
    assert_difference('BasicLtiKey.count', -1) do
      delete :destroy, id: @basic_lti_key
    end

    assert_redirected_to basic_lti_keys_path
  end
end
