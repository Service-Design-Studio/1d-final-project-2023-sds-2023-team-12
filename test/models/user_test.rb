require 'minitest_helper'

class UserUnitTest < ActiveSupport::TestCase
  fixtures :users # Explicitly include the necessary fixture users.yml

  # Testing if the username shown is correct when retrieved by Comments to be displayed in Public Contributions
  test 'retrieve_user_name should return user\'s full name' do
    user = users(:user_one) # Using users fixture in test/fixtures/users.yml
    comment = Comment.new(user_id: user.id)
    assert_equal user.full_name, User.retrieve_user_name(comment)
  end

  # User Authentication
  
  # Testing if the user is valid when all mandatory fields: full_name, mobile_phone, email, password are filled
  test 'valid user when all fields are filled' do
    user = users(:user_two)
    assert user.valid?
  end

  # Testing if the user is invalid when one mandatory field is not filled (example: email field was not filled)
  # Negative cases tests
  test 'invalid user if email not present' do
    user = users(:user_three)
    user.email = nil
    assert_not user.valid?
  end

  # Testing if the user is invalid when the email field is not in the correct format as there need to be a @ symbol
  # Negative cases tests
  test 'invalid user if email not in correct format' do
    user = users(:user_three)
    user.email = 12345.678
    assert_not user.valid?
  end

  # Testing if the user is invalid when the password field have < 6 char
  # Boundary tests
  test 'invalid user if password do not hit char limit' do
    user = users(:user_three)
    user.password = 12345
    assert_not user.valid?
  end

  # Testing if the user is valid when the password field have >= 6 char 
  test 'valid user if password hit char limit' do
    user = users(:user_three)
    user.password = 123456
    assert user.valid?
  end

  # Add more tests as needed

end

