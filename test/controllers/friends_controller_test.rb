require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should not get index without email" do
    get friends_url
    assert_response :bad_request
  end

  test "should not get index with email" do
    user1 = User.create(users(:one).attributes)
    user2 = User.create(users(:two).attributes)
    Friendship.create(user: user1, friend: user2)

    get friends_url, params: {email: user1.email}
    assert_response :ok
    assert_equal(
      {success: true, friends: [user2.email], count: 1}.to_json, 
      response.body)
  end
end
