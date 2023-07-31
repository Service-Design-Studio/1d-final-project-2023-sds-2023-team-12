# To run this controller file only, run 'rails test test/controllers/posts_controller_test.rb'

require 'minitest_helper'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  fixtures :users, :posts # Include the necessary fixtures

  test "get index for the post" do
    @post = posts(:post_one)
    get posts_url
    assert_response :success
  end

  test "get new post" do
    @post = posts(:post_two)
    get new_post_url
    assert_redirected_to new_user_session_path
  end

  test "should create post" do
    @post = posts(:post_three)
    puts @post.inspect # To verify posts fixture exist
    assert_difference("Post.count") do
      post posts_url, params: { 
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

  test "should show post" do
    @post = posts(:post_three)
    get post_url(@post)
    assert_response :success
  end

  test "should update post" do
    @post = posts(:post_three)
    patch post_url(@post), params: { 
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

  test "should destroy post" do
    @post = posts(:post_four)
    puts @post.inspect
    assert_difference("Post.count", -1) do
      delete post_url(@post)

    end

    assert_redirected_to user_posts_path(current_user)

  end

  # Removing because edit method is empty in posts_controller.rb
  #test "should get edit" do
    #@post = posts(:post_one)
    #get edit_post_url(@post)
    #assert_response :success
  #end

end
