# features/steps/post_sorting_steps.rb

Given('the following posts exist:') do |table|
  # Code to create the posts based on the given data in the table
  test_user = User.create!(
    full_name: 'John Doe',
    mobile_phone: '1234567890',
    email: 'john@example.com',
    password: 'secretpassword'
  )
  table.hashes.each do |post_data|
    #user = User.find_or_create_by(full_name: post_data.delete('user_full_name'))
    Post.create!(post_data.merge(user: test_user))
  end

  #debugging: to check that the posts have been created
  puts "Number of posts in the database: #{Post.count}"
end
  
When('I visit the posts page') do
  visit posts_path
end
  
Then('I should see the following posts in order:') do |table|
  # Code to verify the order of the posts based on the table data
  # Use the table.hashes method to access the expected post data in the table
  expected_order = table.hashes.map { |row| row['full_name'] }
  
  # Get the actual post order from the page
  displayed_order = all('.bottom_item.full_name').map { |element| element.text }

  # debugging: to check if they extract the names properly
  puts "Displayed Order: #{displayed_order}"

  # Compare the expected order with the displayed order
  assert_equal(expected_order, displayed_order)
end
  

When('I select {string} from {string}') do |sorting_option, sort_by|
  # Code to select the given sorting option from the specified select field
  select sorting_option, from: sort_by
end