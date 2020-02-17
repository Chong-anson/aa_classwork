require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get :create" do
    get users_:create_url
    assert_response :success
  end

  test "should get :new" do
    get users_:new_url
    assert_response :success
  end

  test "should get :show" do
    get users_:show_url
    assert_response :success
  end

end
