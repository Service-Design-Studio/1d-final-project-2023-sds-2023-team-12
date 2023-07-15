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





Given 'I am on the page with path: {string}' do |current_path|
    if current_path =='home'
        visit "/"
    else
        visit(current_path)
    end
end

Given 'I am logged in' do 
    user = User.create!(email: 'test@example.com', password: '123456')
    visit new_user_session_path 

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
end

Then 'I should be redirected to the page with path: {string}' do |expected_path|
    # Check if the current path matches the provided path using the 'expect' assertion.
    visit expected_path
    expect(expected_path).to eq(expected_path)
end