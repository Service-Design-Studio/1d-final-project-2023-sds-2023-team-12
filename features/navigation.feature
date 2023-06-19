# Cucumber Scenario for "Navigating to Report case Page feature"
# Step definition file created, check 'features/step_definitions/navigation.rb'

Feature: Navigating to the Report Case Page

  As a user
  In order to report a missing person
  I want to go to the Report Case page to fill up the report

  # Happy Path in navigating to report page (Yixuan)
    Scenario: Navigating to report_case #user is logged in
        Given I am on the page with path: 'home'
        And I am logged in
        When I click on 'Report Case'
        Then I should be redirected to the page with path: 'report_case'
