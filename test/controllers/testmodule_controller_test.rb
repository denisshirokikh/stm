require 'test_helper'

class TestmoduleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get testmodule_new_url
    assert_response :success
  end

  test "should get create" do
    get testmodule_create_url
    assert_response :success
  end

  test "should get edit" do
    get testmodule_edit_url
    assert_response :success
  end

  test "should get update" do
    get testmodule_update_url
    assert_response :success
  end

  test "should get destroy" do
    get testmodule_destroy_url
    assert_response :success
  end

  test "should get show" do
    get testmodule_show_url
    assert_response :success
  end

end
