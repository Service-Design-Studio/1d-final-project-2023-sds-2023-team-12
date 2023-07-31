require 'minitest_helper' # Using default Rails MiniTest framework, check test/minitest_helper.rb

class PostUnitTest < ActiveSupport::TestCase
  # Explicitly include the necessary fixtures (users.yml, posts.yml) in the test environment
  fixtures :users, :posts

  # Testing if the post is valid and can be posted successfully if all fields are filled by a user with an account
  test 'valid post when all fields are filled' do
    post = posts(:post_one) # Using posts fixture in test/fixtures/posts.yml
    assert post.valid?
  end

  # Testing if the post is invalid when a mandatory field isn't filled up
  test 'full_name should be present if not post is invalid' do
    post = posts(:post_two)
    post.full_name = nil # Simulating full_name field as blank
    assert_not post.valid?
  end

  # Add more tests as needed

end