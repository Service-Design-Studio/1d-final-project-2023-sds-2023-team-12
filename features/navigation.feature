# Cucumber Scenario for "Navigating to Report case Page feature"
# Step definition file created, check 'features/step_definitions/navigation.rb'

Feature: Ensuring user is not logged in
  Scenario: User is not logged in
  Given I am on the page with path: 'Home'
  Then I should see the login button on the 'navbar'
  And I should not see the logout button on the 'navbar'

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

<<<<<<< HEAD

  # Sad path in navigating report page (Ayu)
  Scenario: Navigating to report_case #user is not logged in 
    Given I am not logged in 
    And on the page with path: 'Home'
    When I select 'Report Case' on the 'navbar'
    Then I should be redirected to the page with path: "login"
=======
# Sad path in navigating report page (Ayu)
    Scenario: Navigating to report_case #user is not logged in 
        Given I am not logged in 
        And on the page with path: 'home'
        When I select 'Report Case' on the 'Navigation Bar'
        Then I should be redirected to the page with path: "login"
>>>>>>> 53fc7fe0ce577086ec8ce46298c0c7a6289bb6ff
