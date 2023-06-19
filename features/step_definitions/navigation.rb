# Happy Path in navigating to report page
# Yixuan's part (Incomplete)

# For [ Given I am on the page with path: 'home' ] and [ Given I am on the page with path: 'report_case' ]
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
    test_email = "testing@email.com"
    test_password = "123456"
    visit "new_user_session"
    fill_in "Email", with: test_username
    fill_in "Password", with: test_password
    click_button "Log in"
end

# For [ When I click on 'Report Case' ]
When 'I click on {string}' do |buttonName|
    # The button or link specified by {string} will be clicked.
    click_link_or_button buttonName
end

# For [ Then I should be redirected to the page with path :'report_case' ]
Then 'I should be redirected to the page with path: {string}' do |path|
    # Check if the current path matches the provided path using the 'expect' assertion.
    expect(current_path).to eq "/#{path}"
end