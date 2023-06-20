# Happy Path in navigating to report page
# Yixuan's Part 

Given 'I am on the page with path: {string}' do |path|
    # Navigate to the provided path specified by {string}
    if path =='home'
        visit "/"
    else
        visit(path)
    end
end

And 'I am logged in' do 
    # Simulate the presence of a logged-in user in the Rails application.

    # Without using RackSessionAccess
    # test_email = "testing@email.com"
    # test_password = "123456"
    # visit "login"
    # fill_in "Email", with: test_username
    # fill_in "Password", with: test_password
    # click_button "Log in"

    # Using RackSessionAccess
    user = User.create!(email: 'test@example.com', password: '123456')
    set_session(:user_id, user.id)
end

# For [ Then I should be redirected to the page with path :'report_case' ]
Then 'I should be redirected to the page with path: {string}' do |path|
    # Check if the current path matches the provided path using the 'expect' assertion.
    expect(current_path).to eq(path)
end


# Ayu's Part 

#Sad Path in navigating to report page (Ayu)

#Scenario: Navigating to report_case #user is not logged in 
# Given I am not logged in 
# And on the page with path: 'home'
Given 'I am not logged' do
    #Add code to ensure user is not logged in, idk how to do yet
end

#Given 'I am on the page with path: {string}' do |path|
    #visit(path)
#end

#When I select 'Report Case' on the 'Navigation Bar'
When 'I select {string} on the {string}' do |path|
    within(element) do
        click_link_or_button path
    end
end

#Then I should be redirected to the page with path: "login"
#Then 'I should be redirected to the page with path: {string}' do |path|
    #expect(current_path).to eq(path)
#end 


#Identifying if a person if a person is logged in/not logged in

#Given I am on the page with path: 'Home'
#Given 'I am on the page with path: {string}' do |path|
    #visit(path)
#end

#Then I should see the login button on the 'navbar'
Then 'I should see the login button on {string}' do |element|
    within(element) do
        expect(page).to have_selector("button", text: "Login")
    end
end

#And I should not see the logout button
Then "I should not see the logout button" do |element| 
    within(element) do
        expect(page).not_to have_selector("button", text:"Logout")
    end
end