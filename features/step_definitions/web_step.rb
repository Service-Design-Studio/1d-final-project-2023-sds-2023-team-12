Given 'I am on the page with path: {string}' do |current_path|
    if current_path =='home'
        visit "/"
    else
        visit(current_path)
    end
end

Given 'I am logged in' do 
    user = User.create!(email: 'test@example.com', password: '123456')
    visit new_user_session_path 

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
end

Then 'I should be redirected to the page with path: {string}' do |expected_path|
    # Check if the current path matches the provided path using the 'expect' assertion.
    visit expected_path
    expect(expected_path).to eq(expected_path)
end