# Implement the step definitions based on feature file "report_case.rb"

# Happy Path in filling up all the mandatory fields in report page
# Yixuan's part

Given 'I am on the Report Case page' do
    visit 'http://localhost:3000/users/1/posts/new'
end

# For [ When I fill the form with the datas: ]
When 'I fill the form with the datas' do
    fill_in 'post[full_name]', with: 'John Doe'
    fill_in 'age', with: '28'
    fill_in 'location', with: 'Tampines'
    fill_in 'description', with: 'Wearing a blue shirt and jeans'
    fill_in 'special_note', with: 'Autistic'
    fill_in 'missing_time', with: 'Sat, 17 Jun 2023 21:33:00.000000000 UTC +00:00'
end

# For [ When I click on 'Report Case' ]
When 'I click on {string} button' do |buttonName|
    # The button or link specified by {string} will be clicked.
    # click_link_or_button is a capybara feature
    click_link_or_button buttonName
end













