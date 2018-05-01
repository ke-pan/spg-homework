require 'test_helper'

class UpdatesControllerTest < ActionDispatch::IntegrationTest
  test "should not get index without valid sender" do
    get updates_url, params: { sender: 'not a email', }
    assert_response :not_found
  end

  test "should not get index without valid text" do
    get updates_url, params: { sender: users(:batman).email, text: [] }
    assert_response :bad_request
  end

  test "should get index" do
    get updates_url, params: {
      sender: users(:batman).email, text: 'Stop! hulk@avengers.com and superman@justiceleague.com'
    }
    assert_response :success
    assert_equal(
      {success: true, recipients: ['superman@justiceleague.com', 'ironman@avengers.com', 'hulk@avengers.com']}.to_json,
      response.body
    )
  end
end
