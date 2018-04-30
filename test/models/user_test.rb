require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it can create user with valid email' do
    assert_difference 'User.count' do
      User.create(email: 'abc@test.com')
    end
  end

  test 'it can not create user with invalid email' do
    assert_difference 'User.count', 0 do
      User.create(email: 'abc#test.com')
    end
  end
end
