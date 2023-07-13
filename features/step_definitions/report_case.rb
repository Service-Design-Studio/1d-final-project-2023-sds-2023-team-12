# When ("I fill in the form with the following data") do |table|
#   # Convert the table to a hash
#   data = table.rows_hash

#   # Fill in the form fields
#   fill_in 'full name', with: data['Full name']
#   # fill_in 'Age', with: data['Age']
#   # fill_in 'Location', with: data['Location']
#   # fill_in 'Description', with: data['Description']
#   # fill_in 'Special note', with: data['Special note']
#   # fill_in 'Missing Time', with: data['Missing Time']
#   # attach_file 'Images', 'path/to/image.jpg'
# end

When ('I fill in {string} in the {string} field') do |name,namefield|
  fill_in namefield, with: name
end
