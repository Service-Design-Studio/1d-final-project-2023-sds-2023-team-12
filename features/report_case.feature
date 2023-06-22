# Cucumber Scenario for "Report a Case feature"
# Step definition file created, check 'features/step_definitions/report_case.rb'

Feature: As a user I want to be able fill up the form to report a missing person, edit my form and delete my form.

  # Happy Path in creating new report
  Scenario Outline: Creating a new report in report_case page with a complete form
    Given I am on the page with path: 'report_case'
    When I fill the form with the datas
    | Full Name | Age | Location | Description | Special note | Missing time | images | 
    When I click on 'Create Post' button
    Then I should be redirected to the page with path: 'show_post_detail'
    And I should see a message 'Post was successfully created, click on show cases to see your case'

  Scenarios: 
  | Full Name | Age | Location | Description | Special note | Missing time | images | 
  | John Doe  | 28 | Tampines | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |
 

 # Sad Path in creating new report
  Scenario Outline: Creating a new report in report_case page with an incomplete form
    Given I am on the page with path: 'report_case'
    When I fill the form with the datas:
    | Full Name | Age | Location | Description | Special note | Missing time | images | 
    When I click on 'Create Post' button
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
  


  # Happy Path in editing the form
  Scenario Outline: Updating an existing report from show_post_detail page with a complete form
    Given I am on the page with path: 'show_post_detail'
    When I click on 'Edit' button
    Then I should be redirected to the page with path: 'edit_user_post'
    When I fill the form with the datas:
    | Full Name | Age | Location | Description | Special note | Missing time | images | 
    When I click on 'Update Post' button
    Then I should be redirected to the page with path: 'show_post_detail'
    And I should see a message 'Post was successfully updated, click on show cases to see your case'

  Scenarios: 
  | Full Name | Age | Location | Description | Special note | Missing time | images | 
  | John Doe  | 28 | Pasir Ris | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |

  # Sad path in editing the form
  Scenario Outline: Updating an existing report from show_post_detail page with an incomplete form
    Given I am on the page with path: 'show_post_detail'
    When I click on 'Edit' button
    Then I should be redirected to the page with path: 'edit_user_post'
    When I fill the form with the datas:
    | Full Name | Age | Location | Description | Special note | Missing time | images | 
    When I click on 'Update Post' button
    Then I should see a prompt for missing field with: 
    | Full name can't be blank | Age can't be blank | Location can't be blank | Description can't be blank | Special note can't be blank | Missing time can't be blank | Image data can't be blank
    And I will stay on the page with path: 'report_case'

  Scenarios: 
  | Full Name | Age | Location | Description | Special note | Missing time | images | 
  | | 28 | Tampines | Wearing a blue shirt and black jeans | Autistic | Sat, 17 Jun 2023 21:33:00 +0000 | image.jpg |


  Scenarios: Deleting an existing report from show_post_detail page
  Given I am on the page with path: 'show_post_detail'
  When I click on 'Delete' button
  Then I should be redirected to the page with path: 'show_all_cases'
  And I should see a message 'Post was successfully destroyed, we are happy that you have found your loved ones'
  

