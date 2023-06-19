# Cucumber Scenario for "Report a Case feature"
# Step definition file created, check 'features/step_definitions/report_case.rb'

Feature: As a user I want to fill up the form to report a missing person

  # Happy Path in filling up all the mandatory fields in report page (Yixuan)
  Scenario: User is logged in and fills up the form with all mandatory fields
    Given I am on the page with path: 'report_case'
    When I fill the form with the datas:
      | Full Name | Age | Location | Description                    | Special note | Missing time          | images     |
      | John Doe  | 28  | Tampines | Wearing a blue shirt and jeans | Autistic     | 12/06/2023 10:30 AM   | image.jpg  |
    When I click on 'Create Post'
    Then I should see a message 'Post was successfully created, click on show cases to see your case'
    Then I should be redirected to the page with path: 'show_post_detail'
 
 # Sad Path in creating new report (Ayu)
Scenario Outline: Creating a new report in report_case page with an incomplete form
  Given I am on the page with path: 'report_case'
  When I fill the form with the datas:
  | Full Name | Age | Location | Description | Special note | Missing time | images | 
  When I select "Create Post" 
  Then I should see a prompt for missing field with: 
  | Full name can't be blank | Age can't be blank | Location can't be blank | Description can't be blank | Special note can't be blank | Missing time can't be blank | Image data can't be blank
  And I will stay on the page with path: 'report_case'

Scenarios: 
| Full Name | Age | Location | Description | Special note | Missing time | images | 
| | 28 | Tampines | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |
|John Doe | | Tampines | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |
|John Doe | 28| | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |
|John Doe | 28 | Tampines | | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg | 
|John Doe | 28 | Tampines | Wearing a blue shirt and black jeans | | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |
|John Doe | 28 | Tampines | Wearing a blue shirt and black jeans | Autistic | | image.jpg |
|John Doe | 28 | Tampines | Wearing a blue shirt and black jeans | Austistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |
#not sure how to actually write the image file field yet will leave image.jpg as placeholder 