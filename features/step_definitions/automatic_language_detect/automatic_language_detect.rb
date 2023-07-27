
Then(/^I should see "([^"]*)" or "([^"]*)"$/) do |msg1,msg2|
  expect(page).to have_content(/msg1|msg2/)
end

Then(/^I should see "([^"]*)" for "([^"]*)" field$/) do |msg1,msg2|
  expect(page).to have_content(msg1)
end

Then(/^I update "([^"]*)" field with "([^"]*)"$/) do |field_name,value|
  fill_in(field_name, :with => value)
end