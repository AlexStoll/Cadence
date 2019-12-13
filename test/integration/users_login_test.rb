require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:alex)
  end

  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"

    # Log in with invalid info
    post login_path, params: { session: {email: "", 
                                         password: ""} }

    # Should stay on the same page with a flash.now message, clears on refresh
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    assert_template "sessions/new"
    
    # Logging in with fixture.yml info
    post login_path, params: { session: {email: @user.email, 
                                         password: 'CAtwostar2*'}} 
    
    # Logged in successfully, affirming and following redirect to user's page
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    
    # Check for correct links
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "logout" do
    get login_path
    
    # Logging in with fixture.yml info
    post login_path, params: { session: {email: @user.email, 
                                         password: 'CAtwostar2*'}} 

    delete logout_path
    assert_not is_logged_in?
  end
end
