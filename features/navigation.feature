# Cucumber Scenario for "Navigating to Report case Page feature"
# Step definition file created, check 'features/step_definitions/navigation.rb'


Feature: Navigating to the Report Case Page

  # Happy Path in navigating to report page (Yixuan)
  Scenario: Navigating to report_case #user is logged in
    Given I am on the page with path: 'home'
    And I am logged in
    When I click on 'report-case'
    Then I should be redirected to the page with path: 'report_case'

  # Sad path in navigating report page (Ayu)
  Scenario: Navigating to report_case #user is not logged in 
    Given I am not logged in 
    And on the page with path: 'Home'
    When I select 'Report Case' on the 'navbar'
    Then I should be redirected to the page with path: "login"

# By Ayu (but it just affect testing at the moment as we are not using it yet)
#Feature: Ensuring user is not logged in
  #Scenario: User is not logged in
    #Given I am on the page with path: 'Home'
    #Then I should see the login button on the 'navbar'
    #And I should not see the logout button on the 'navbar'