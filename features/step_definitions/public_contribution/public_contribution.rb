Given(/^I am on "([^"]*)" page for a particular post$/) do |page_name|
    visit new_user_session_path

    case page_name
    when "Post Detail"
        user = User.create!(email: 'test@example.com', password: '123456')
    when "Edit"
        logout
        visit new_user_session_path
        user = User.create!(email: 'test1@example.com', password: '123456')
    else
        pending
    end

    visit new_user_session_path 

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    route = CapybaraHelper::PAGE_MAP["Home".to_sym]

    click_on("Report Case")

    case page_name 
    when "Post Detail"
        CapybaraHelper::POST_FORM_FIELD_POST_DETAIL.each_pair do |key,value|
            fill_in(key, :with => value)
        end     
    when "Edit"
        CapybaraHelper::POST_FORM_FIELD_EDIT_POST.each_pair do |key,value|
            fill_in(key, :with => value)
        end
    else
        pending
    end

    image_path = Rails.root.join('app', 'assets', 'images','reporting_case','young-adult.png')
    attach_file('post[image]', image_path)

    button_name="Create Post"
    button_name=button_name.to_sym
    button = CapybaraHelper::BUTTON_MAP[button_name]
    find_button(class: button).click

    case page_name
    when "Post Detail"
        expect(page).to have_content("Missing Case Detail")
    when "Edit"
        button_name="Edit Post"
        button_name=button_name.to_sym
        button = CapybaraHelper::BUTTON_MAP[button_name]
        # find_button(class: button).click
        @user=User.find_by(email: 'test1@example.com')
        @post=Post.find_by(full_name: 'David')
        route="/users/#{@user.id}/posts/#{@post.id}/edit"
        visit route
        expect(page).to have_current_path(route)
    else
        pending
    end

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




