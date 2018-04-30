require 'test_helper'

class CommonFriendsControllerTest < ActionDispatch::IntegrationTest
  test "should not get index without email" do
    get friends_url
    assert_response :not_found
  end

  test "should get index with email" do
    get common_friends_url, params: {friends: [users('batman').email, users('spiderman').email]}
    assert_response :ok
    assert_equal(
      {success: true, friends: [users('superman').email], count: 1}.to_json, 
      response.body
    )
  end
end
