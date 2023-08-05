Then(/^I should see "([^"]*)" section$/) do |msg|
  expect(page).to have_content(msg)
end

Then(/^I should see correct answer$/) do
    expect(page).to have_content("We are generating answer...Please wait !")
end




# BUTTON INTERACTION AND CLICKINH BEHABIOR
Then(/^I click on the "([^"]*)" button in "([^"]*)" section$/) do |button_name,section_name|
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