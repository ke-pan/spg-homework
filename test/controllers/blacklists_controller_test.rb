require 'test_helper'

class BlacklistsControllerTest < ActionDispatch::IntegrationTest
  test "should not create a blacklist without valid params" do
    post blacklists_url, params: { requestor: "lisa@example.com", target: "" }
    assert_response :bad_request
    assert_equal({success: false, message: 'param is missing or the value is empty: target'}.to_json, response.body)
  end

  test "should not create a blacklist with same email" do
    post blacklists_url, params: { requestor: "lisa@example.com", target: "lisa@example.com" }
    assert_response :bad_request
    assert_equal({success: false, message: 'can not self-blacklist'}.to_json, response.body)
  end

  test "should create a blacklist" do
    assert_difference 'Blacklist.count', 1 do
      post blacklists_url, params: { requestor: "lisa@example.com", target: "john@example.com" }
    end
    assert_response :success
    assert_equal({success: true}.to_json, response.body)
  end
end
