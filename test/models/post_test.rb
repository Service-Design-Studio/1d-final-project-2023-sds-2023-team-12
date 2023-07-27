require 'minitest_helper' # Using default Rails MiniTest framework, check test/minitest_helper.rb

class PostTest < ActiveSupport::TestCase
  # Explicitly include the necessary fixtures (users.yml, posts.yml) in the test environment
  fixtures :users, :posts

  # If not using fixtures, manual setup:
  #def setup
    #@user = users(:one) # Using fixture data for users (test/fixtures/users.yml)
    #image_path = Rails.root.join('app', 'assets', 'images','reporting_case','young-adult.png')
    #@post = Post.new(
      #full_name: 'John Doe',
      #age: 30,
      #location: 'Jurong Point',
      #description: 'Missing person description',
      #special_note: 'Important note',
      #image: fixture_file_upload(image_path, 'image/png'),
      #missing_time: Time.now,
      #user: @user
    #)
  #end

  # Testing if the post is valid and can be posted successfully if all fields are filled by a user with an account
  test 'valid post' do
    post = posts(:post_two) # Using posts fixture in test/fixtures/posts.yml
    assert post.valid?
  end

  # Testing if the post is invalid when a field isn't filled up
  test 'full_name should be present' do
    post = posts(:post_three)
    post.full_name = nil # Simulating full_name field as blank
    assert_not post.valid?
  end

  # Add more tests as needed

end

