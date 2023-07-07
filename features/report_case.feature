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
  Given I am on the page with path: 'report_case'
  When I fill '_form' with data
  | Full Name | John Doe |
  | Age | 8 |
  | Location | Tampines |
  |Description | Wearing a blue shirt |
  |Special note | Has Autism |
  |Missing Time | Sat, 17 Jun 2023 21:33:00 +0000 |
  | Images | image.jpg |


