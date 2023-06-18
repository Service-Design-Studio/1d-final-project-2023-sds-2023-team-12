# Cucumber Scenario for "Report a Case feature"
# Yixuan: Feel free to edit
# Step definition file created, check 'features/step_definitions'

#Happy path in navigating report page
Scenario: Navigating to report_case #user is logged in
  Given I am logged in
  And on the page with path: 'home'
  When I select 'Report Case' on the 'Navigation Bar'
  Then I should be redirected to the page with path :'report_case'

#Sad path in navigating report page
Scenario: Navigating to report_case #user is not logged in 
  Given I am not logged in 
  And on the page with path: 'home'
  When I select 'Report Case' on the 'Navigation Bar'
  Then I should be redirected to the page with path: "login"

#Happy Path in creating a report: 
Feature: Filling up a form for reporting a missing person

  As a user
  In order to report a missing person
  I want to fill up the form with all the mandatory fields
  # Mandatory fields: name, gender, age, location, date, time, description
  # Non-mandatory fields: special cases, description for special cases

  Background:
    Given I am on the home page

  Scenario: User is logged in and fills up the form with all mandatory fields
    Given I am logged in
    When I click on the "Report" button
    Then I should be redirected to the New Report page
    And I fill in "Name" with "John Doe"
    And I select "Male" from "Gender"
    And I select "30" from "Age"
    And I fill in "Location" with "Jurong West"
    And I select "2023-01-01" as the "Date"
    And I select "12:00" as the "Time"
    And I fill in "Description" with "John Doe was last seen wearing a blue shirt and jeans."
    When I click on the "Submit Report" button
    Then I should see a message "Your report has been posted"
    And the missing person case should be successfully submitted

  Scenario: User is logged in but does not fill up all the mandatory fields
    Given I am logged in
    When I click on the "Report" button
    Then I should be redirected to the New Report page
    And I fill in "Name" with "John Doe"
    And I select "Male" from "Gender"
    # Never fill in age
    And I fill in "Location" with "Jurong West"
    And I select "2023-01-01" as the "Date"
    And I select "12:00" as the "Time"
    # Never fill in description
    When I click on the "Submit Report" button
    Then I should see an error message "Please fill up all the mandatory fields"
    And the missing person case should not be submitted

  Scenario: User is not logged in and tries to fill up the form
    Given I am not logged in
    When I click on the "Report" button
    Then I should be redirected to the login page


#Sad Path in creating new report
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
