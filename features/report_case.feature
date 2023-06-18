# Cucumber Scenario for "Report a Case feature"
# Yixuan: Feel free to edit
# Step definition file created, check 'features/step_definitions'

Feature: Navigating to the Report Case Page

  As a user
  In order to report a missing person
  I want to go to the Report Case page to fill up the report

  Background:
    Given I am on the page with path: 'home'

  # Happy Path in navigating to report page (Yixuan)
  Scenario: Navigating to report_case #user is logged in
    Given I am logged in
    When I click on 'Report Case' on 'Navigation Bar'
    Then I should be redirected to the page with path :'report_case'

  # Sad path in navigating report page (Ayu)
  Scenario: Navigating to report_case #user is not logged in 
    Given I am not logged in 
    And on the page with path: 'home'
    When I select 'Report Case' on the 'Navigation Bar'
    Then I should be redirected to the page with path: "login"

Feature: Filling up a form for reporting a missing person

  As a user
  In order to report a missing person
  I want to fill up the form with all the mandatory fields
  # Mandatory fields: name, gender, age, location, date, time, description
  # Non-mandatory fields: special cases, description for special cases

  # Happy Path in filling up all the mandatory fields in report page (Yixuan)
  Scenario Outline: User is logged in and fills up the form with all mandatory fields
    Given I am on the page with path: 'report_case'
    When I fill the form with the datas:
  | Full Name | Age | Location | Description | Special note | Missing time | images | 
    When I click on "Create Post"
    Then I should see a message "Your report has been posted."
    Then I should be redirected to the page with path: "show_case"

  Scenarios: 
  | Full Name | Age | Location | Description | Special note | Missing time | images | 
  |John Doe | 28 | Tampines | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |





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
|John Doe | 28 | Tampines | Wearing a blue shirt and black jeans | Austistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg
#not sure how to actually write the image file field yet will leave image.jpg as placeholder 





