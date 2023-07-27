@sign_in
Feature: signing in as user
  As an family member of missing person
  I want sign in to the app to post information about my missing loved one
  So that general public can contribute to the searching process

Background: View Log In page
    Given I am on the "Log In" page
    Then I should see "Log in"  
    Then I should see a "Log In" form with the following fields "Email", "Password"
    And I should see a "Log in" button

@happy_path
Scenario Outline: Login with correct credentials
    Given I am on the "Log In" page
    When I fill in my correct credentials with valid email and password
    And I click on the "Log in" button
    Then I should be redirected to the "Home" page
    And I should see notification "Signed in successfully."

@sad_path
Scenario Outline: Unable to login with incorrect credentials
    Given I am on the "Log In" page
    When I fill in my credentials with invalid email and password
    And I click on the "Log in" button
    Then I should stay on the "Log In" page

 