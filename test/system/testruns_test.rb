require "application_system_test_case"

class TestrunsTest < ApplicationSystemTestCase
  setup do
    @testrun = testruns(:one)
  end

  test "visiting the index" do
    visit testruns_url
    assert_selector "h1", text: "Testruns"
  end

  test "creating a Testrun" do
    visit testruns_url
    click_on "New Testrun"

    fill_in "Body", with: @testrun.body
    fill_in "Completed", with: @testrun.completed
    fill_in "Project", with: @testrun.project_id
    fill_in "Title", with: @testrun.title
    click_on "Create Testrun"

    assert_text "Testrun was successfully created"
    click_on "Back"
  end

  test "updating a Testrun" do
    visit testruns_url
    click_on "Edit", match: :first

    fill_in "Body", with: @testrun.body
    fill_in "Completed", with: @testrun.completed
    fill_in "Project", with: @testrun.project_id
    fill_in "Title", with: @testrun.title
    click_on "Update Testrun"

    assert_text "Testrun was successfully updated"
    click_on "Back"
  end

  test "destroying a Testrun" do
    visit testruns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testrun was successfully destroyed"
  end
end
