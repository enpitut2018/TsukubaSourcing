require "application_system_test_case"

class JobcommentsTest < ApplicationSystemTestCase
  setup do
    @jobcomment = jobcomments(:one)
  end

  test "visiting the index" do
    visit jobcomments_url
    assert_selector "h1", text: "Jobcomments"
  end

  test "creating a Jobcomment" do
    visit jobcomments_url
    click_on "New Jobcomment"

    fill_in "Comment", with: @jobcomment.comment
    fill_in "Job", with: @jobcomment.job_id
    fill_in "Star", with: @jobcomment.star
    click_on "Create Jobcomment"

    assert_text "Jobcomment was successfully created"
    click_on "Back"
  end

  test "updating a Jobcomment" do
    visit jobcomments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @jobcomment.comment
    fill_in "Job", with: @jobcomment.job_id
    fill_in "Star", with: @jobcomment.star
    click_on "Update Jobcomment"

    assert_text "Jobcomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Jobcomment" do
    visit jobcomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jobcomment was successfully destroyed"
  end
end
