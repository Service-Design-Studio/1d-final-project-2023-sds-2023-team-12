require 'minitest_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:comment_one)
  end

  test "should get index" do
    get comments_url
    assert_response :success

  end

  test "should get new" do
    get new_comment_url
    assert_response :success

  end

  test "should create comment" do
    assert_difference("Comment.count") do
      get comments_url, params: { 
      #post comments_url(@comment.post_id), params: { 
        comment: { 
          body: @comment.body 
          } 
        }
    end

    assert_redirected_to show_post_detail_path(@comment.post_id)

  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: {
       comment: {
        body: @comment.body 
        } 
      }
      
    assert_redirected_to show_post_detail_path(@comment.post_id)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to show_post_detail_path(@post_id)

  end

end
