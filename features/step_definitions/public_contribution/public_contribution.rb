Given(/^I am on Post Detail page for a particular post$/) do
    visit new_user_session_path 
    user = User.create!(email: 'test@example.com', password: '123456')
    visit new_user_session_path 

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    route = CapybaraHelper::PAGE_MAP["Home".to_sym]

    click_on("Report Case")

    CapybaraHelper::POST_FORM_FIELD.each_pair do |key,value|
        fill_in(key, :with => value)
    end

    image_path = Rails.root.join('app', 'assets', 'images','reporting_case','young-adult.png')
    attach_file('post[image]', image_path)

    button_name="Create Post"
    button_name=button_name.to_sym
    button = CapybaraHelper::BUTTON_MAP[button_name]
    find_button(class: button).click

    expect(page).to have_content("Missing Case Detail")

end

When(/^I fill in comment field with "([^"]*)"$/) do |content|
    fill_in("comment[body]", with: content)
end

And(/^I am on Post Detail page for missing person name "([^"]*)"$/) do |person_name|
    @post=Post.find_by(full_name: person_name)
    route="/post/#{@post.id}/detail"
    visit(route)
    expect(page).to have_current_path(route) 
end




