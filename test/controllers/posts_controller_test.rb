# Post Controller Test
# To run this controller file only, run 'rails test test/controllers/posts_controller_test.rb'

require 'minitest_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users, :posts # Include the necessary fixtures

  # Testing to check if index action for posts is accessible
  test "get index for the post" do
    @post = posts(:post_one)
    @user = users(:user_one)
    get posts_url(@user) # Sends a GET request to the index action with the user's posts URL
    assert_response :success # Ensure the response status is 'success' (200)
  end

  # Testing to check if a new post page redirects to the login page when the user is not signed in
  test "get new post" do
    @post = posts(:post_two)
    get new_post_url #  Sends a GET request to the new action to create a new post
    assert_redirected_to new_user_session_path
  end

  # Testing to check if a post is created successfully
  test "should create post" do
    @post = posts(:post_three)
    assert_difference("Post.count") do
      post posts_url, params: { # Sends a POST request to the create action with valid post parameters
        post: { 
          full_name: @post.full_name,
          age: @post.age, 
          location: @post.location, 
          description: @post.description,  
          special_note: @post.special_note,
          missing_time: @post.missing_time,
          user: @post.user, 
          user_id: @post.user_id # Add this line to pass user_id in the create action 
        }
      }
    end

    assert_redirected_to show_post_detail_path(Post.last)

  end

  # Testing to check if the post show action is functioning correctly (fetching the data for the specific post and rendering the appropriate view to display the post's details)
  test "should show post" do
    @post = posts(:post_three)
    get post_url(@post) # Sends a GET request to the show action with the URL
    assert_response :success
  end

  # Testing to check if a post is updated successfully
  test "should update post" do
    @post = posts(:post_three)
    patch post_url(@post), params: { # Sends a PATCH request to the update action with valid post parameters
      post: { 
        age: @post.age, 
        description: @post.description, 
        full_name: @post.full_name, 
        location: @post.location, 
        special_note: @post.special_note,
       }
      }
    assert_redirected_to show_post_detail_path(@post)
  end

end
