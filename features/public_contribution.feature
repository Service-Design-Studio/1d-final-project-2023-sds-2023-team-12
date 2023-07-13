Feature:
    As a general public member
    I want to be able to add a comment to an existing active post
    So that my contribution can be used to assist in finding the missing person

Scenario: Navigating to a specific case from the Show Cases page
    Given I am on the page with path: 'posts'
    And I am logged in
    When I press the "More details..." button 
    Then I should be redirected to the page with path: ""

Scenario: Creating a comment on a specific page
    Given I am on the page with path: ""
    When I fill in "" with 'I saw one person that look like your missing loved one'
    And I press the "Create Comment" button
    Then I should see the comment 'I saw one person that look like your missing loved one'
    And I should see a pop up "Comment was successfully created"

Scenario: Unsuccessfully creating a comment
    Given I am on the page with path: ""
    When I fill in "" with ''
    And I press the "Create Comment" button
    Then I should see a pop up "Comment can not be empty"

Scenario: Deleting a comment
    Given I am on the page with path: ""
    And there is a comment "I saw one person that look like your missing loved one"
    When I press the "Delete" button contained in "" 
    Then I should not see the comment "I saw one person that look like your missing loved one"
    And I should see a pop up "Comment was successfully destroyed." 
    
Scenario Updating a comment: 
    Given I am on the page with path: ""
    And there is a comment "I saw one person that look like your missing loved one"
    When I press the "Edit" button contained in ""
    And I update the comment "I saw that person that look like your missing loved one"
    And I press the "Update Comment" button 
    Then I should see "I saw that person that look like your missing loved one"
    And I should see a pop up "Comment was successfully updated."
    
