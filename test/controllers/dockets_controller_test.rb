require 'test_helper'

class DocketsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get dockets_create_url
    assert_response :success
  end

end
