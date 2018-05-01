require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should not create a subscription without valid params" do
    post subscriptions_url, params: { requestor: "lisa@example.com", target: "" }
    assert_response :bad_request
    assert_equal({success: false, message: 'param is missing or the value is empty: target'}.to_json, response.body)
  end

  test "should create a subscription" do
    assert_difference 'Subscription.count', 1 do
      post subscriptions_url, params: { requestor: "lisa@example.com", target: "john@example.com" }
    end
    assert_response :success
    assert_equal({success: true}.to_json, response.body)
  end
end
