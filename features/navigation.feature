# Cucumber Scenario for "Navigating to Report case Page feature"
# Step definition file created, check 'features/step_definitions/navigation.rb'

Feature: Navigating to the Report Case Page

  As a user
  In order to report a missing person
  I want to go to the Report Case page to fill up the report

  Background:
    Given I am on the page with path: 'home'

  # Happy Path in navigating to report page (Yixuan)
  Scenario: Navigating to report_case #user is logged in
    Given I am logged in
    When I click on 'Report Case'
    Then I should be redirected to the page with path :'report_case'


    # Sad path in navigating report page (Ayu)
    Scenario: Navigating to report_case #user is not logged in 
        Given I am not logged in 
        And on the page with path: 'home'
        When I select 'Report Case' on the 'Navigation Bar'
        Then I should be redirected to the page with path: "login"