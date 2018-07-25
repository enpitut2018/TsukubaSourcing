require 'test_helper'

class JobcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jobcomment = jobcomments(:one)
  end

  test "should get index" do
    get jobcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_jobcomment_url
    assert_response :success
  end

  test "should create jobcomment" do
    assert_difference('Jobcomment.count') do
      post jobcomments_url, params: { jobcomment: { comment: @jobcomment.comment, star: @jobcomment.star, user_id: @jobcomment.user_id } }
    end

    assert_redirected_to jobcomment_url(Jobcomment.last)
  end

  test "should show jobcomment" do
    get jobcomment_url(@jobcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_jobcomment_url(@jobcomment)
    assert_response :success
  end

  test "should update jobcomment" do
    patch jobcomment_url(@jobcomment), params: { jobcomment: { comment: @jobcomment.comment, star: @jobcomment.star, user_id: @jobcomment.user_id } }
    assert_redirected_to jobcomment_url(@jobcomment)
  end

  test "should destroy jobcomment" do
    assert_difference('Jobcomment.count', -1) do
      delete jobcomment_url(@jobcomment)
    end

    assert_redirected_to jobcomments_url
  end
end
