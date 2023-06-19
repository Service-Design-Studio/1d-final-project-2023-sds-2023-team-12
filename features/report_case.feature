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
 