require 'minitest_helper'


class UserUnitTest < ActiveSupport::TestCase
  fixtures :users # Explicitly include the necessary fixture users.yml

  # Testing if the username shown is correct when retrieved by Comments to be displayed
  test 'retrieve_user_name should return user\'s full name' do
    user = users(:user_one) # Using users fixture in test/fixtures/users.yml
    comment = Comment.new(user_id: user.id)
    assert_equal user.full_name, User.retrieve_user_name(comment)
  end

  test 'valid user' do
    user = users(:user_two)
    assert user.valid?
  end

  test 'email should be present' do
    user = users(:user_three)
    user.email = nil
    assert_not user.valid?
  end

  # Add more tests as needed

end

