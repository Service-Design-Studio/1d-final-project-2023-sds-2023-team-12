Feature: Public Contribution 
    As the owner of the post
    I want to be able delete the invalid or irrelevant comments
    So that my post contains only the most accurate and updated information to facilitate the investigation process

Scenario: Creating a comment given the user is logged in 
    Given I am on the Post Detail Page with post id ""
    When I see the comment "your missing one is so beautiful"
    And I press the 'Delete' button
    Then I should not see the Comment 'your missing one is so beautiful'
    And I should see a pop up 'Comment was successfully destroyed'