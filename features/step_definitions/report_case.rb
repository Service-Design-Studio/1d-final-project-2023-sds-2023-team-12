# Implement the step definitions based on feature file "report_case.rb"

# Happy Path in filling up all the mandatory fields in report page
# Yixuan's part (Incomplete)

# For [ When I fill the form with the datas: ]
When 'I fill the form with the datas:' do |table|
    table.hashes.each do |data|
        data.each do |field, value|
          fill_in field, with: value
        end
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












