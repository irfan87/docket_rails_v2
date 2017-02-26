require 'test_helper'

class WelcomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_pages_index_url
    assert_response :success
  end

end
