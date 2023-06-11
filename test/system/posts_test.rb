require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Age", with: @post.age
    fill_in "Description", with: @post.description
    fill_in "Full name", with: @post.full_name
    fill_in "Location", with: @post.location
    fill_in "Special note", with: @post.special_note
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Age", with: @post.age
    fill_in "Description", with: @post.description
    fill_in "Full name", with: @post.full_name
    fill_in "Location", with: @post.location
    fill_in "Special note", with: @post.special_note
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_url(@post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
