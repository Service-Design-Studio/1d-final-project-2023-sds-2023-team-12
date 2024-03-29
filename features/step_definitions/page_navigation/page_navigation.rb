# Implement the step definitions based on feature file "page_check.rb"

Then 'I should see a message {string}' do |text|
    page.has_text?(text)
end

Then 'I should see {string} button on NavBar' do |buttonName|
    page.has_button?(buttonName)
end

Then 'I should see {string} button' do |buttonName|
    page.has_button?(buttonName)
end