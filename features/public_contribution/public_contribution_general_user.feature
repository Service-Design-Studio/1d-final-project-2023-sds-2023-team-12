@public_contribition_feature_general_public
Feature: Public Contribution 
    As a general public member
    I want to be able to add a comment to an existing active post
    So that my contribution can be used to assist in finding the missing person

Background: User as general public can view post detail and create a comment
    Given I am on "Post Detail" page for a particular post

@happy_path
Scenario: Creating a comment given the user is logged in 
    Given I am logged in as general public
    And I am on Post Detail page for missing person name "David"
    Then I should see "Missing Case Detail"
    And I should see "Welcome Public Contribution"
    Then I fill in comment field with "I saw one person that look like your missing loved one"
    And I click on the "Create Comment" button
    Then I should see "I saw one person that look like your missing loved one"
    And I should see a pop up "Comment was successfully created"

Scenario: Deleting a comment
    Given I am logged in as general public
    And I am on Post Detail page for missing person name "David"
    Then I fill in comment field with "I saw one person that look like your missing loved one"
    And I click on the "Create Comment" button
    Then I should see "I saw one person that look like your missing loved one"
    And I should see a "Delete" button
    When I click on the "Delete" button
    Then I should not see "I saw one person that look like your missing loved one"
    And I should see a pop up "Comment was successfully destroyed." 

Scenario: Updating a comment
    Given I am logged in as general public
    And I am on Post Detail page for missing person name "David"
    Then I fill in comment field with "I saw one person that look like your missing loved one"
    And I click on the "Create Comment" button
    Then I should see "I saw one person that look like your missing loved one"
    And I should see a "Edit" button
    When I click on the "Edit" link
    And I fill in comment field with "I saw one person that look like your missing loved one - updated"
    And I click on the "Create Comment" button
    Then I should see "I saw one person that look like your missing loved one - updated"
    And I should see a pop up "Comment was successfully updated." 

@sad_path
Scenario: Unsuccessfully creating a comment because user left the comment field empty 
    Given I am logged in as general public
    And I am on Post Detail page for missing person name "David"
    Then I should see "Missing Case Detail"
    And I should see "Welcome Public Contribution"
    Then I fill in comment field with ""
    And I click on the "Create Comment" button
    Then I should stay on same Post Detail page for missing person name "David"
    And I should see a pop up "Comment can not be empty"

Scenario: Creating a comment on a specific page but I am not logged in
    Given I am not logged in 
    And I am on Post Detail page for missing person name "David"
    Then I fill in comment field with "I saw one person that look like your missing loved one"
    And I click on the "Create Comment" button
    Then I should be redirected to the "Log In" page
    And I should see notification "You have not sign in, please sign in!"