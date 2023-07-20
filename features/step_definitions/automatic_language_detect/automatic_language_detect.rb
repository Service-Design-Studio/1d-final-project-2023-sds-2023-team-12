
Then(/^I should see "([^"]*)" or "([^"]*)"$/) do |msg1,msg2|
  expect(page).to have_content(/msg1|msg2/)
end