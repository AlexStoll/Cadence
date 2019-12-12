class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         'Cadence'
    assert_equal full_title('Help'), 'Help | Cadence'
  end
end