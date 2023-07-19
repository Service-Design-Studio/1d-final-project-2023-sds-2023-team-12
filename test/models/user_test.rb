require 'minitest_helper'


class UserTest < ActiveSupport::TestCase
  fixtures :users # Explicitly include the necessary fixture users.yml

  # Testing if the username shown is correct when retrieved by Comments to be displayed
  test 'retrieve_user_name should return user\'s full name' do
    user = users(:one) # Using users fixture in test/fixtures/users.yml
    comment = Comment.new(user_id: user.id)
    assert_equal user.full_name, User.retrieve_user_name(comment)
  end

  #test 'valid user' do
    #user = User.new(
      #full_name: 'User',
      #mobile_phone: '24682468',
      #email: "user_#{SecureRandom.uuid}@gmail.com",
      #password: '123456'
    #)
    #assert user.valid?
  #end

  #test 'email should be present' do
    #user = User.new(
      #full_name: 'User',
      #mobile_phone: '24682468',
      #password: '123456'
    #)
    #assert_not user.valid?
  #end

  # Add more tests as needed

end

