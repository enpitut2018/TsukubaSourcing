require 'test_helper'

class AssignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # assignsが予約語なので手動
    User.new(name: "assign_test_user", email: "assign_test_user@example.com", password: "password").save
    @user = User.last
    @job = Job.create(title: "Mystring", user_id: @user.id, description: "Mystring")
    @assign = Assign.create(job_id: @job.id, user_id: @user.id, status: "Mystring") #assigns(:one)
  end

  test "should get index" do
    get assigns_url
    assert_response :success
  end

  test "should get new" do
    get new_assign_url
    assert_response :success
  end

  test "should create assign" do
    assert_difference('Assign.count') do
      post assigns_url, params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    end

    assert_redirected_to job_url(Assign.last.job)
  end

  test "should show assign" do
    get assign_url(@assign)
    assert_response :success
  end

  test "should get edit" do
    get edit_assign_url(@assign)
    assert_response :success
  end

  test "should update assign" do
    get root_path
    patch assign_url(@assign), params: { assign: { job_id: @assign.job_id, status: @assign.status, user_id: @assign.user_id } }
    assert_redirected_to root_path
  end

  test "should destroy assign" do
    assert_difference('Assign.count', -1) do
      delete assign_url(@assign)
    end

    assert_redirected_to assigns_url
  end

  test "should get review" do
    get review_assign_url(@assign)
  end
end
