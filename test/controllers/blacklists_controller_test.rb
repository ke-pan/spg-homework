require 'test_helper'

class BlacklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post blacklists_url
    assert_response :success
  end
end
