require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def title(page)
    "#{page} | Cadence"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", title('Home')
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", title('Home')
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", title('Help')
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", title('About')
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", title('Contact')
  end
end
