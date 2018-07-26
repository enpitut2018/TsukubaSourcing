require 'test_helper'

class Jobs::EvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jobs_evaluation = jobs_evaluations(:one)
  end

  test "should get index" do
    get jobs_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_jobs_evaluation_url
    assert_response :success
  end

  test "should create jobs_evaluation" do
    assert_difference('Jobs::Evaluation.count') do
      post jobs_evaluations_url, params: { jobs_evaluation: { comment: @jobs_evaluation.comment, star: @jobs_evaluation.star, user_id: @jobs_evaluation.user_id } }
    end

    assert_redirected_to jobs_evaluation_url(Jobs::Evaluation.last)
  end

  test "should show jobs_evaluation" do
    get jobs_evaluation_url(@jobs_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_jobs_evaluation_url(@jobs_evaluation)
    assert_response :success
  end

  test "should update jobs_evaluation" do
    patch jobs_evaluation_url(@jobs_evaluation), params: { jobs_evaluation: { comment: @jobs_evaluation.comment, star: @jobs_evaluation.star, user_id: @jobs_evaluation.user_id } }
    assert_redirected_to jobs_evaluation_url(@jobs_evaluation)
  end

  test "should destroy jobs_evaluation" do
    assert_difference('Jobs::Evaluation.count', -1) do
      delete jobs_evaluation_url(@jobs_evaluation)
    end

    assert_redirected_to jobs_evaluations_url
  end
end
