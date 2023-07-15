Feature: general public create a comment to the existing post

    As a general public member
    I want to be able to add a comment to an existing active post
    So that my contribution can be used to assist in finding the missing person

    Background: View Post Detail Page
    Given I am on the "Show All Posts" page
    Then I should see this text "All Active Missing Cases"
    Then I should see this text "Sign Up"
    Then I should see this text "John"

    Then I should see this text "John"
    And I should see a "More details" button

@happy
Scenario: Navigating to a specific case from the Show Cases page
    Given I am on the page with path: 'posts'
    And I am logged in
    When I press the "More details" button 
    Then I should be redirected to the page with path: ''