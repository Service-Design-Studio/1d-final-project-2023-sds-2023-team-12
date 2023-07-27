# To run this controller file only, run 'rails test test/controllers/posts_controller_test.rb'

require 'minitest_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    posts(:post_one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { 
        post: { 
          age: @post.age, 
          description: @post.description, 
          full_name: @post.full_name, 
          location: @post.location, 
          special_note: @post.special_note,
          user_id: @post.user_id, # Add this line to pass user_id in the create action 
        }
      }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { 
      post: { 
        age: @post.age, 
        description: @post.description, 
        full_name: @post.full_name, 
        location: @post.location, 
        special_note: @post.special_note,
        user_id: @post.user_id, # Add this line to pass user_id in the update action
       }
      }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    #assert_redirected_to posts_url
    assert_redirected_to user_posts_path(current_user)
  end
end
