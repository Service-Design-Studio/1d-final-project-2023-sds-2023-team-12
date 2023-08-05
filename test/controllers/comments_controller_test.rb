require 'minitest_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users, :posts, :comments
  
  setup do
    @comment = comments(:comment_one)
  end

  # Testing to check if index action for comments is accessible
  test "should get index" do
    get comments_url
    # Ensure the response status is 'success' (200)
    assert_response :success

  end

  # Testing to check if the new comment page is accessible
  test "should get new" do
    get new_comment_url
    assert_response :success

  end

  # Testing to check if a comment is created successfully
  test "should create comment" do
    post = posts(:post_one)
    user = users(:user_one)
  
    # Store the current count of comments
    initial_comment_count = Comment.count
  
    # Create a new comment using the Comment model's create method
    new_comment = Comment.create(
      body: "This is a new comment",
      post: post, # Associate the comment with the post
      user: user  # Associate the comment with the user
    )
  
    # Check if the comment was successfully created
    assert new_comment.persisted?
  
    # Check if the comment count has increased by 1
    assert_equal initial_comment_count + 1, Comment.count
  
    # Check if the comment's post and user associations are correct
    assert_equal post, new_comment.post
    assert_equal user, new_comment.user
  end
  
  # Testing to check if the comment show action is functioning correctly
  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  # Testing to check if the edit comment page is accessible
  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  # Testing to check if a comment is updated successfully
  test "should update comment" do
    patch comment_url(@comment), params: { # Sends a PATCH request to the update action with valid comment parameters
       comment: {
        body: @comment.body 
        } 
      }
      
    assert_redirected_to show_post_detail_path(@comment.post_id)
  end

  # Testing to check if a comment is deleted successfully
  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to show_post_detail_path(@comment.post_id)

  end

end

