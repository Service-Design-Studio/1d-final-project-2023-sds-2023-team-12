# Implement the step definitions based on feature file "report_case.rb"

# Happy Path in navigating to report page
# Yixuan's part (Incomplete)

# For [ Given I am on the page with path: 'home' ] and [ Given I am on the page with path: 'report_case' ]
Given 'I am on the page with path: {string}' do |path|
    visit(path)
end

Given 'I am logged in' do 
    page.set_rack_session(user_id: 1)
end

# For [ When I click on 'Report Case' on 'Navigation Bar' ]
When('When I click on {string} on {string}') do |buttonName,controller|
    click_button buttonName/#{controller}
end

# For [ Then I should be redirected to the page with path :'report_case' ]
Then 'I should be redirected to the page with path {string}' do |action|
    expect(current_path).to eq "/#{action}"
end

# Happy Path in filling up all the mandatory fields in report page
# Yixuan's part (Incomplete)

# For [ When I fill the form with the datas: ]
When 'I fill the form with the datas:' do |table|
    table.rows_hash.each do |a, b|
      fill_in a, with: b
    end
end
  
# For [ When I click on "Create Post" ]
When 'I click on {string}' do |buttonName|
    click_button buttonName
end

# For [ Then I should see a message "Your report has been posted." ]
Then 'I should see a message {string}' do |text|
    page.has_text?(text)
end











