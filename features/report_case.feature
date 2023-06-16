# Cucumber Scenario for "Report a Case feature"
# Yixuan: Feel free to edit
# Step definition file created, check 'features/step_definitions'

Feature: Filling up a form for reporting a missing person

  As a user
  In order to report a missing person
  I want to fill up the form with all the mandatory fields
  # Mandatory fields: name, gender, age, location, date, time, description
  # Non-mandatory fields: special cases, description for special cases

  Background:
    Given I am on the home page

  Scenario: User is logged in and fills up the form with all mandatory fields
    Given I am logged in
    When I click on the "Report" button
    Then I should be redirected to the New Report page
    And I fill in "Name" with "John Doe"
    And I select "Male" from "Gender"
    And I select "30" from "Age"
    And I fill in "Location" with "Jurong West"
    And I select "2023-01-01" as the "Date"
    And I select "12:00" as the "Time"
    And I fill in "Description" with "John Doe was last seen wearing a blue shirt and jeans."
    When I click on the "Submit Report" button
    Then I should see a message "Your report has been posted"
    And the missing person case should be successfully submitted

  Scenario: User is logged in but does not fill up all the mandatory fields
    Given I am logged in
    When I click on the "Report" button
    Then I should be redirected to the New Report page
    And I fill in "Name" with "John Doe"
    And I select "Male" from "Gender"
    # Never fill in age
    And I fill in "Location" with "Jurong West"
    And I select "2023-01-01" as the "Date"
    And I select "12:00" as the "Time"
    # Never fill in description
    When I click on the "Submit Report" button
    Then I should see an error message "Please fill up all the mandatory fields"
    And the missing person case should not be submitted

  Scenario: User is not logged in and tries to fill up the form
    Given I am not logged in
    When I click on the "Report" button
    Then I should be redirected to the login page
