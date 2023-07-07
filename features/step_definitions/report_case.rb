When ('I press the {string} button') do |button|
    click_button button
  end

When("I fill {string} with data") do |form_name, table|
  case form_name
  when '_form'
    data = table.raw
  # Access the individual values using indexing
    full_name = data[1][1]
    age = data[2][1]
    location = data[3][1]
    description = data[4][1]
    special_note = data[5][1]
    missing_time = data[6][1]
    images = data[7][1]
  
  # Use the extracted values to fill the form or perform the desired actions
    fill_in 'Full Name', with: full_name
    fill_in 'Age', with: age
    fill_in 'Location', with: location
    fill_in 'Description', with: description
    fill_in 'Special note', with: special_note
    fill_in 'Missing Time', with: missing_time
    attach_file('Images', images)
  end
end