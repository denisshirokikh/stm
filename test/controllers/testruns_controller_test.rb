require 'test_helper'

class TestrunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testrun = testruns(:one)
  end

  test "should get index" do
    get testruns_url
    assert_response :success
  end

  test "should get new" do
    get new_testrun_url
    assert_response :success
  end

  test "should create testrun" do
    assert_difference('Testrun.count') do
      post testruns_url, params: { testrun: { body: @testrun.body, completed: @testrun.completed, project_id: @testrun.project_id, title: @testrun.title } }
    end

    assert_redirected_to testrun_url(Testrun.last)
  end

  test "should show testrun" do
    get testrun_url(@testrun)
    assert_response :success
  end

  test "should get edit" do
    get edit_testrun_url(@testrun)
    assert_response :success
  end

  test "should update testrun" do
    patch testrun_url(@testrun), params: { testrun: { body: @testrun.body, completed: @testrun.completed, project_id: @testrun.project_id, title: @testrun.title } }
    assert_redirected_to testrun_url(@testrun)
  end

  test "should destroy testrun" do
    assert_difference('Testrun.count', -1) do
      delete testrun_url(@testrun)
    end

    assert_redirected_to testruns_url
  end
end
