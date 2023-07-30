Feature: Creating a report for a missing person

  As a user
  I want to fill up, edit, delete and close a case
  So that I can report a case of a missing person

Background: I want to report a missing case when i am already logged in
  Given I am logged in
  And I am on the "Home" page
  Then I click on "Report Case" button in navigation bar
  Then I should see "Create Case"

@happy_path
Scenario: Report a new case will correct and valid information 
  Given I should see "Create Case"
  And I should see the "Post" form with the following fields: full_name, age, location, description, special_note, missing_time, avatar
  When I fill in "Full name" field with "David"
  And I fill in "Age" field with "34"
  And I fill in "Location" field with "Changi"
  And I fill in "Description" field with "Wearing a red T shirt"
  And I fill in "Special note" field with "elderly"
  And I fill in "Missing time" field with "Sat, 17 Jun 2023 21:33:00 +0000"
  And I fill in "image" field with valid image
  And I click on the "Create Post" button
  Then I should see "Missing Case Detail"
  And I should see "Welcome Public Contribution"
  And I should see notification "Post was successfully created, click on show cases to see your case"


@sad_path
Scenario: Report a new case will invalid information
  Given I should see "Create Case"
  And I should see the "Post" form with the following fields: full_name, age, location, description, special_note, missing_time, avatar  
  When I fill in "Full name" field with ""
  And I fill in "Age" field with "34"
  And I fill in "Location" field with "Changi"
  And I fill in "Description" field with "Wearing a red T shirt"
  And I fill in "Special note" field with "elderly"
  And I fill in "Missing time" field with "Sat, 17 Jun 2023 21:33:00 +0000"
  And I fill in "image" field with valid image
  And I click on the "Create Post" button
  Then I should not see "Missing Case Detail"
  And I should not see "Welcome Public Contribution"
  And I should see notification "Full name field can not leave blank"

Scenario: Report a new case while I have yet to logged in 
  Given I am not logged in 
  And I am on the "Home" page
  Then I click on "Report Case" button in navigation bar
  Then I should be redirected to the "Log In" page
  And I should see notification "You have not sign in, please sign in!"
