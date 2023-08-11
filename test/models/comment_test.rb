require 'minitest_helper'

class CommentUnitTest < ActiveSupport::TestCase
  # Explicitly include the necessary fixtures (users.yml, posts.yml, comments.yml) in the test environment
  fixtures :users, :posts, :comments

  # Testing if the comment is valid if a user with an account comments something
  test 'comment body present should be valid' do
    comment = comments(:comment_one) # Using comments fixture in test/fixtures/comments.yml
    assert comment.valid?
  end

  # Testing if the comment is invalid if a user with an account comments nothing
  # Negative cases tests
  test 'comment body not present should be invalid' do
    comment = comments(:comment_three)
    comment.body = nil # Simulating comment body as blank
    assert_not comment.valid?
  end


  # Add more tests as needed

end

