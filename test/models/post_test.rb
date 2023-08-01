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
  # Negative cases tests
  test 'full_name not present and post is invalid' do
    post = posts(:post_two)
    post.full_name = nil # Simulating full_name field as blank
    assert_not post.valid?
  end

  # Testing if the post is invalid when age field is filled up with a negative number
  # Negative cases tests
  test 'age not postive number and post is invalid' do
    post = posts(:post_four)
    post.age = -2 # Simulating age field as negative number
    assert_not post.valid?
  end

  # Testing if the post is valid when age field is filled up with 0 as it is the minimum age
  # Boundary tests
  test 'age is zero and post is valid' do
    post = posts(:post_three)
    post.age = 0 # Simulating age field as zero
    assert post.valid?
  end

  # Testing if the post is invalid when reward field is filled up with a negative number
  # Negative cases tests
  test 'reward is not postive number and post is invalid' do
    post = posts(:post_one)
    post.reward = -100 # Simulating reward field as negative number
    assert_not post.valid?
  end

  # Testing if the post is valid when reward field is filled up with 0 as it is the minimum amount
  # Boundary tests
  test 'reward is zero and post is valid' do
    post = posts(:post_two)
    post.reward = 0 # Simulating reward field as zero
    assert post.valid?
  end


  # Add more tests as needed

end