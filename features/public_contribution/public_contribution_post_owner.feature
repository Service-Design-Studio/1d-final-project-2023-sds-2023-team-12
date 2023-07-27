@public_contribition_feature_owner
Feature: Public Contribution 
    As the owner of the post
    I want to be able delete the invalid or irrelevant comments
    So that my post contains only the most accurate and updated information to facilitate the investigation process

Background:
    Given I am on "Post Detail" page for a particular post
    Then I am logged in as general public
    And I am on Post Detail page for missing person name "David"
    And I fill in comment field with "Your missing person is so beautiful"
    And I click on the "Create Comment" button
    Then I should see "Your missing person is so beautiful"

Scenario: Delete invalid comment from my own post
    Given I am the owner of the post of missing person name "David"
    And I am on Post Detail page for missing person name "David"
    And I should see "Your missing person is so beautiful"
    And I click on the "Delete" button
    Then I should not see "Your missing person is so beautiful"
    And I should see a pop up "Comment was successfully destroyed."