require "application_system_test_case"

class TestcasesTest < ApplicationSystemTestCase
  setup do
    @testcase = testcases(:one)
  end

  test "visiting the index" do
    visit testcases_url
    assert_selector "h1", text: "Testcases"
  end

  test "creating a Testcase" do
    visit testcases_url
    click_on "New Testcase"

    fill_in "Body", with: @testcase.body
    fill_in "Testmodule", with: @testcase.testmodule_id
    fill_in "Title", with: @testcase.title
    click_on "Create Testcase"

    assert_text "Testcase was successfully created"
    click_on "Back"
  end

  test "updating a Testcase" do
    visit testcases_url
    click_on "Edit", match: :first

    fill_in "Body", with: @testcase.body
    fill_in "Testmodule", with: @testcase.testmodule_id
    fill_in "Title", with: @testcase.title
    click_on "Update Testcase"

    assert_text "Testcase was successfully updated"
    click_on "Back"
  end

  test "destroying a Testcase" do
    visit testcases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testcase was successfully destroyed"
  end
end
