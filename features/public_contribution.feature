Feature: Public Contribution 
    As a general public member
    I want to be able to add a comment to an existing active post
    So that my contribution can be used to assist in finding the missing person

Scenario: Creating a comment given the user is logged in 
    Given I am on the Post Detail Page with post id ""
    When I fill in comment field with 'I saw one person that look like your missing loved one'
    And I press the 'Create Comment' button
    Then I should see the Comment 'I saw one person that look like your missing loved one'
    And I should see a pop up 'Comment was successfully created'

Scenario: Deleting a comment
    Given I am on the Post Detail Page with post id ""
    And I should see my comment "I saw one person that look like your missing loved one"
    When I press the "Delete" button
    Then I should not see the comment "I saw one person that look like your missing loved one"
    And I should see a pop up "Comment was successfully destroyed." 

Scenario: Updating a comment
    Given I am on the Post Detail Page with post id ""
    And there is a comment "I saw one person that look like your missing loved one"
    When I press the "Edit" button contained in ""
    And I fill in the comment field with the comment with "I saw that person that look like your missing loved one - updated"
    And I press the "Update Comment" button 
    Then I should see "I saw that person that look like your missing loved one - updated"
    And I should see a pop up "Comment was successfully updated."





Scenario: Unsuccessfully creating a comment because user left the comment field empty 
    Given I am on the Post Detail Page with post id ""
    When I fill in comment field with ''
    And I press the 'Create Comment' button
    Then I should not see the Comment 'I saw one person that look like your missing loved one'
    And I should see a pop up 'Comment can not be empty'

Scenario: Creating a comment on a specific page but I am not logged in
    Given I am on the Post Detail Page with post id ""
    And I am not logged in 
    When I fill in the comment field with 'I saw one person that look like your missing loved one'
    And I press the 'Create Comment' button
    Then I should be redirected to the page with path: "login"

    