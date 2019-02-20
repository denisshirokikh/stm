require 'test_helper'

class TestcasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testcase = testcases(:one)
  end

  test "should get index" do
    get testcases_url
    assert_response :success
  end

  test "should get new" do
    get new_testcase_url
    assert_response :success
  end

  test "should create testcase" do
    assert_difference('Testcase.count') do
      post testcases_url, params: { testcase: { body: @testcase.body, testmodule_id: @testcase.testmodule_id, title: @testcase.title } }
    end

    assert_redirected_to testcase_url(Testcase.last)
  end

  test "should show testcase" do
    get testcase_url(@testcase)
    assert_response :success
  end

  test "should get edit" do
    get edit_testcase_url(@testcase)
    assert_response :success
  end

  test "should update testcase" do
    patch testcase_url(@testcase), params: { testcase: { body: @testcase.body, testmodule_id: @testcase.testmodule_id, title: @testcase.title } }
    assert_redirected_to testcase_url(@testcase)
  end

  test "should destroy testcase" do
    assert_difference('Testcase.count', -1) do
      delete testcase_url(@testcase)
    end

    assert_redirected_to testcases_url
  end
end
