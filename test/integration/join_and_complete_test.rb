require 'test_helper'

class JoinAndCompleteTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:test_user)
    @job = jobs(:one)
    post '/users/sign_in', params: { user: {email: 'user3@example.com', password: 'password'}}
  end
  test "join" do
    get root_path
    assert_difference('Assign.count') do
      post assigns_path, params: {assign:{job_id: @job.id, user_id: @user.id, status: 'join'}}
    end
    assert_redirected_to job_path(@job)
  end
  test "complete" do
    get root_path
    put assign_path(Assign.last), params: {assign:{status: 'complete'}}
    assert_redirected_to "/jobs/" + Assign.last.job_id.to_s + "#userlist"
  end
end