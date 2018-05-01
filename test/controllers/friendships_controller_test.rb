require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should not create friendships with invalid params" do
    post friendships_url
    assert_response :bad_request
  end

  test "should not create friendships with invalid email" do
    post friendships_url, params: {friends: ['abc@test.com', 'abc#test.com']}
    assert_response :bad_request
  end

  test "should not create friendships with same email" do
    post friendships_url, params: {friends: ['abc@test.com', 'abc@test.com']}
    assert_response :bad_request
  end

  test "should not create friendships if got blocked" do
    post friendships_url, params: {friends: [users(:spiderman).email, users(:wonderwoman).email]}
    assert_response :bad_request
    assert_equal({success: false, message: "user:#{users(:wonderwoman).id} blocks user:#{users(:spiderman).id}"}.to_json, response.body)
  end


  test "should create friendships with valid params" do
    assert_difference 'Friendship.count', 2 do
      post friendships_url, params: {friends: ['abc@test.com', 'abc1@test.com']}
    end
    assert_response :ok
    assert_equal({success: true}.to_json, response.body)
  end
end
