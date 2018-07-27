require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "invalid signup 
    information" do
    get '/users/sign_up'
    assert_no_difference 'User.count' do
      post '/users/', params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template "devise/registrations/new"
  end

  test "valid signup information" do
    get '/users/sign_up'
    assert_difference 'User.count', 1 do
      post '/users/', params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'jobs/index'
  end

  test "valid sign_in information" do
    get '/users/sign_in'
    post '/users/', params: {session: {email:"user1@example.com",password:"password"}}
    assert_response :success    
  end

  test "invalid sign_in information" do
    get '/users/sign_in'
    post '/users/', params: {session: {email:"",password:""}}
    assert_template "devise/registrations/new"
  end
end
