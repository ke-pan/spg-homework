require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post subscriptions_url
    assert_response :success
  end
end
