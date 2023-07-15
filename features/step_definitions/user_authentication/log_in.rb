
Then(/^I should see a "([^"]*)" form with the following fields "Email", "Password"$/) do |form_name|
  case form_name
  when "Log In"
    expect(page).to have_field("user[email]")
    expect(page).to have_field("user[password]")
  else
    pending
  end
end

When(/^I fill in my correct credentials with valid email and password$/ ) do 
    fill_in('Email', :with => 'user123@email.com')
    fill_in('Password', :with => 'user123')
end

When(/^I fill in my credentials with invalid email and password$/ ) do 
  fill_in('Email', :with => 'user1111@email.com')
  fill_in('Password', :with => 'user1111')
end

Given 'I am logged in' do 
  user = User.create!(email: 'test@example.com', password: '123456')
  visit new_user_session_path 

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end

And 'I am logged in' do 
fill_in 'Email', with: user.email
fill_in 'Password', with: user.password
click_button 'Log in'
end

