require "application_system_test_case"

class Jobs::EvaluationsTest < ApplicationSystemTestCase
  setup do
    @jobs_evaluation = jobs_evaluations(:one)
  end

  test "visiting the index" do
    visit jobs_evaluations_url
    assert_selector "h1", text: "Jobs/Evaluations"
  end

  test "creating a Evaluation" do
    visit jobs_evaluations_url
    click_on "New Jobs/Evaluation"

    fill_in "Comment", with: @jobs_evaluation.comment
    fill_in "Star", with: @jobs_evaluation.star
    fill_in "User", with: @jobs_evaluation.user_id
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Evaluation" do
    visit jobs_evaluations_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @jobs_evaluation.comment
    fill_in "Star", with: @jobs_evaluation.star
    fill_in "User", with: @jobs_evaluation.user_id
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluation" do
    visit jobs_evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluation was successfully destroyed"
  end
end
