
Then(/^I should see the "([^"]*)" form with the following fields: (.*)$/) do |form_name,list_of_items|
  field_list=list_of_items.split(", ")
  case form_name
  when "Post"
  
  field_list.each do |item| 
    expect(page).to have_field("post[#{item}]")
  end
  else
    pending 
  end
end

Then(/^I fill in "([^"]*)" field with "([^"]*)"$/) do |field_name,value|
  fill_in(field_name, :with => value)
end

Then(/^I fill in "([^"]*)" field with valid image/) do |field|
  image_path = Rails.root.join('app', 'assets', 'images','reporting_case','young-adult.png')
  attach_file('post[avatar]', image_path)
end