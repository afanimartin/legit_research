require "test_helper"

class RoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get role_index_url
    assert_response :success
  end

  test "should get new" do
    get role_new_url
    assert_response :success
  end

  test "should get create" do
    get role_create_url
    assert_response :success
  end
end
