require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
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
end
