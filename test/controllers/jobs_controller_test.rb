require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
 include Devise::Test::IntegrationHelpers

  setup do
    @job = jobs(:one)
  end

  def signin(user)
    @user = users(user)
    sign_in(@user)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new with signed in" do
    signin(:one)
    get new_job_url
    assert_response :success
  end

  test "should not get new without signed in" do
    get new_job_url
    assert_redirected_to root_path
  end

  test "should create job with signed in" do
    signin(:one)
    assert_difference('Job.count') do
      post jobs_url, params: { job: { description: @job.description, title: @job.title, user_id: @job.user_id } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should not create job without signed in" do
    assert_no_difference('Job.count') do
      post jobs_url, params: { job: { description: @job.description, title: @job.title, user_id: @job.user_id } }
    end

    assert_redirected_to jobs_url
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit with signed in" do
    signin(:one)
    get edit_job_url(@job)
    assert_response :success
  end

  test "should not get edit with signed in another user" do
    signin(:two)
    get edit_job_url(@job)
    assert_redirected_to root_path
  end

  test "should not get edit without signed in" do
    get edit_job_url(@job)
    assert_redirected_to root_path
  end

  test "should update job with signed in" do
    signin(:one)
    patch job_url(@job), params: { job: { description: @job.description, title: @job.title, user_id: @job.user_id } }
    assert_redirected_to job_url(@job)
  end

  test "should not update job with signed in another user" do
    signin(:two)
    patch job_url(@job), params: { job: { description: @job.description, title: @job.title, user_id: @job.user_id } }
    assert_redirected_to jobs_url
  end

  test "should not update job without signed in" do
    patch job_url(@job), params: { job: { description: @job.description, title: @job.title, user_id: @job.user_id } }
    assert_redirected_to jobs_url
  end

  test "should destroy job with signed in" do
    signin(:one)
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end

  test "should not destroy job with signed in another user" do
    signin(:two)
    assert_no_difference('Job.count') do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end

  test "should not destroy job without signed in" do
    assert_no_difference('Job.count') do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
