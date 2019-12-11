require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def title(page)
    "#{page} | Cadence"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", 'Cadence'
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", title('Help')
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", title('About')
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", title('Contact')
  end
end
