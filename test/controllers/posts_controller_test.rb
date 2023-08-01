# To run this controller file only, run 'rails test test/controllers/posts_controller_test.rb'

require 'minitest_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users, :posts # Include the necessary fixtures

  test "get index for the post" do
    @post = posts(:post_one)
    @user = users(:user_one)
    get posts_url(@user)
    #get user_posts_url(@user)
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

  # To run just this test, 'rails test test/controllers/posts_controller_test.rb -n test_should_destroy_post'
  test "should destroy post" do
    #puts Rails.application.routes.routes.map { |r| "#{r.verb} #{r.path}" }
    @post = posts(:post_one)
    @user = users(:user_one)


    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to user_posts_path(@user)


  end

end
