# Implement the step definitions based on feature file "report_case.rb"

# Happy Path in filling up all the mandatory fields in report page
# Yixuan's part (Incomplete)

# For [ Given I am on the page with path: 'home' ] and [ Given I am on the page with path: 'report_case' ]
Given 'I am on the page with path: {string}' do |path|
    # Navigate to the provided path specified by {string}
    visit(path)
end

# For [ When I fill the form with the datas: ]
When 'I fill the form with the datas:' do |table|
    data = table.rows_hash
    data.each do |field, value|
        fill_in field, with: value
    end
end

# For [ When I click on 'Create Post' ]
When 'I click on {string}' do |buttonName|
    # The button or link specified by {string} will be clicked.
    click_link_or_button buttonName
end

# For [ Then I should see a message "Your report has been posted." ]
Then 'I should see a message {string}' do |text|
    expect(page).to have_text(text)
end

# For [ Then I should be redirected to the page with path :'show_post_detail' ]
Then 'I should be redirected to the page with path {string}' do |action|
    # Check if the current path matches the provided path using the 'expect' assertion.
    expect(current_path).to eq "/#{action}"
end











