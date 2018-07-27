require 'test_helper'

class AssignsControllerTest < ActionDispatch::IntegrationTest
 include Devise::Test::IntegrationHelpers

  setup do
    @job = jobs(:one)
  end

  def signin_and_assign(signin_user:, assign_user:)
    @user = users(signin_user)
    sign_in(@user)
    @assign = Assign.create(job_id: @job.id, user_id: users(assign_user).id, status: "Mystatus")
  end

  test "should create assign" do
    signin_and_assign(signin_user: :two, assign_user: :two)

    assert_difference('Assign.count') do
      post assigns_url, params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    end

    assert_redirected_to job_url(Assign.last.job)
  end

  test "should not create assign my job" do
    signin_and_assign(signin_user: :one, assign_user: :one)

    assert_no_difference('Assign.count') do
      post assigns_url, params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    end

    assert_redirected_to root_path
  end

  test "should not create assign with signed in another user" do
    signin_and_assign(signin_user: :two, assign_user: :one)

    assert_no_difference('Assign.count') do
      post assigns_url, params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    end

    assert_redirected_to root_path
  end

  test "should update assign" do
    signin_and_assign(signin_user: :one, assign_user: :one)

    get root_path
    patch assign_url(@assign), params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    assert_redirected_to root_path
  end

  test "should not update assign with signed in another user" do
    signin_and_assign(signin_user: :two, assign_user: :one)

    get root_path
    patch assign_url(@assign), params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    assert_redirected_to root_path
  end

  test "should destroy assign" do
    signin_and_assign(signin_user: :one, assign_user: :one)

    assert_difference('Assign.count', -1) do
      delete assign_url(@assign)
    end

    assert_redirected_to root_path
  end

  test "should not destroy assign with signed in another user" do
    signin_and_assign(signin_user: :two, assign_user: :one)

    assert_no_difference('Assign.count') do
      delete assign_url(@assign)
    end

    assert_redirected_to root_path
  end
end
