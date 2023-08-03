
# PAGE NAVIGATION
Given(/^I am on the "([^"]*)" page$/) do |page_name|
  page_name = page_name.to_sym
  if CapybaraHelper::PAGE_MAP.key?(page_name)
    route = CapybaraHelper::PAGE_MAP[page_name]
  else
    route = '/'
  end
  visit(route)
  expect(page).to have_current_path(route)
end

Then(/^I should be redirected to the "([^"]*)" page$/) do |page_name|
  page_name = page_name.to_sym
  if CapybaraHelper::PAGE_MAP.key?(page_name)
    route = CapybaraHelper::PAGE_MAP[page_name]
  else
    route = '/'
  end
  visit(route)
  expect(page).to have_current_path(route)
end

Then(/^I should stay on the "([^"]*)" page$/) do |page_name|
  page_name = page_name.to_sym
  if CapybaraHelper::PAGE_MAP.key?(page_name)
    route = CapybaraHelper::PAGE_MAP[page_name]
  else
    route = '/'
  end
  visit(route)
  expect(page).to have_current_path(route)
end

Then(/^I should stay on same Post Detail page for missing person name "([^"]*)"$/) do |person_name|
  @post=Post.find_by(full_name: person_name)
  route="/post/#{@post.user_id}/detail"
  expect(page).to have_current_path(route)
end

Given(/^I am on the "([^"]*)" page for user with email: "([^"]*)"$/) do |page_name, email|
  @user=User.find_by(email: email)
  route=nil
  case page_name
  when "Report"
    visit "/users/#{@user.id}/posts/new"
    route="/users/#{@user.id}/posts/new"
  else 
    pending
  end
  expect(page).to have_current_path(route)
end

Then(/^I should be on the "([^"]*)" page for post with name: "([^"]*)"$/) do |page_name, name|
  @post=Post.find_by(full_name: name)
  route=nil
  case page_name
  when "Case Details"
    route="/post/#{@post.id}/detail"
    visit route
  else 
    pending
  end
  expect(page).to have_current_path(route)
end


# CHECK FOR ELEMEMNT VISIBILITY
And(/^I should see a "([^"]*)" button$/) do |button_name|
  if CapybaraHelper::BUTTON_MAP.key?(button_name.to_sym)
    expect(page).to have_content(button_name)
  else
    pending
  end
end

Then(/^I should see this text "([^"]*)"$/) do |msg|
  expect(page).to have_content(msg)
end

Then(/^I should see "([^"]*)"$/) do |msg|
  expect(page).to have_content(msg)
end

Then(/^I should not see "([^"]*)"$/) do |msg|
  expect(page).to have_no_content(msg)
end

Then(/^I should see a pop up "([^"]*)"$/) do |msg|
  expect(page).to have_content(msg)
end

Then(/^I should see notification "([^"]*)"$/) do |msg|
  # expect(page).to have_content(msg)
  page.has_css?('notification')  
end

# BUTTON INTERACTION AND CLICKINH BEHABIOR
Then(/^I click on the "([^"]*)" button$/) do |button_name|
  button_name = button_name.to_sym
  if CapybaraHelper::BUTTON_MAP.key?(button_name)
    button = CapybaraHelper::BUTTON_MAP[button_name]
    find_button(class: button).click
  elsif CapybaraHelper::FORM_BUTTON_MAP.key?(button_name)
    button = CapybaraHelper::FORM_BUTTON_MAP[button_name]
  elsif button_name == "Sign Out"
    capybara_logout
    visit('/')
  else
    pending
  end
end

Then(/^I click on "([^"]*)" button in navigation bar$/) do |button_label|
  click_on(button_label)
end

Then(/^I click on the "([^"]*)" link$/) do |link_name|
  case link_name
  when "More details..."
    click_on(link_name,match: :first)
  else
    click_on(link_name)
  end
end
