
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

# CHECK FOR ELEMEMNT VISIBILITY
And(/^I should see a "([^"]*)" button$/) do |button_name|
  if CapybaraHelper::BUTTON_MAP.key?(button_name.to_sym)
    expect(page).to have_content(button_name)
  elsif CapybaraHelper::FORM_BUTTON_MAP.key?(button_name.to_sym)
    button = CapybaraHelper::FORM_BUTTON_MAP[button_name.to_sym]
    name = find(:xpath, "//*[@id=\"#{button}\"]")['value']
    expect(name).to be == button_name.to_s
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

Then(/^I should see notification "([^"]*)"$/) do |msg|
  page.has_css?('notification')  
end

# BUTTON INTERACTION
Then(/^I click on the "([^"]*)" button$/) do |button_name|
  button_name = button_name.to_sym
  if CapybaraHelper::BUTTON_MAP.key?(button_name)
    button = CapybaraHelper::BUTTON_MAP[button_name]
    find_button(class: button).click
    # find(:xpath, "//*[@id=\"#{button}\"]").click
  elsif CapybaraHelper::FORM_BUTTON_MAP.key?(button_name)
    button = CapybaraHelper::FORM_BUTTON_MAP[button_name]
    find(:xpath, "//*[@id=\"#{button}\"]").click
  elsif button_name == "Sign Out"
    capybara_logout
    visit('/')
  else
    pending
  end
end