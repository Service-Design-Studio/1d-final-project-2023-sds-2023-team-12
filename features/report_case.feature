Feature: Creating a report for a missing person
  As a user
  I want to fill up, edit, delete and close a case
  So that I can report a case of a missing person

Background: There are already missing people cases and I want to add my own case

Scenario: navigating to report case page and I am logged in
  Given I am on the page with path: 'home'
  And I am logged in
  When I press the 'Report Case' button
  Then I should be redirected to the page with path: 'report_case'

Scenario: Reporting a missing person successfully
  Given I am on the page with path: '/posts/new'
  Then I should see a message 'Create Case'
  Then I should see a message 'Full name'
  When I fill in "John Doe" in the "Full name" field
