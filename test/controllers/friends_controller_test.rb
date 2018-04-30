require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should not get index without email" do
    get friends_url
    assert_response :not_found
  end

  test "should not get index with email" do
    get friends_url, params: {email: users('batman').email}
    assert_response :ok
    assert_equal(
      {success: true, friends: [users('superman').email, users('wonderwoman').email], count: 2}.to_json, 
      response.body)
  end
end
