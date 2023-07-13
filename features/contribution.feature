# Happy path

Feature: As a user I want to contribute to the public contribution section

Scenario: Contributing to the public contribution section and I am logged in
    Given I am on the page with path: 'show_post_detail_path(@comment.post_id)'
    And I am logged in
    When I fill in the comment body with 'I saw one person that look like your missing loved one'
    And I press the 'Create Comment' button
    Then I should see the comment 'I saw one person that look like your missing loved one'
    And I should see a pop up 'Comment was successfully created'

Scenario: Editing a comment in the public contribution section
    Given I am on the page with path: 'show_post_detail_path(@comment.post_id)'
    And I am logged in
    When I press the 'Edit' button
    And I fill in the comment body with 'I saw one person that look like your missing loved one at Paya Lebar'
    Then I should see the comment 'I saw one person that look like your missing loved one at Paya Lebar'
    And I should see a pop up 'Comment was successfully updated'

Scenario: Deleting a comment in the public contribution section
    Given I am on the page with path: 'show_post_detail_path(@comment.post_id)'
    And I am logged in
    When I press the 'Delete' button
    Then I should see a pop up 'Comment was successfully destroyed.'

# Sad path

Scenario: Contributing to the public contribution section and I am not logged in
    Given I am on the page with path: 'show_post_detail_path(@comment.post_id)'
    When I fill in the comment body with 'I saw one person that look like your missing loved one'
    And I press the 'Create Comment' button
    Then I should be redirected to the page with path: 'login'

Scenario: Contributing to the public contribution section with an empty comment
    Given I am on the page with path: 'show_post_detail_path(@comment.post_id)'
    And I am logged in
    When I fill in the comment body with ''
    Then I should see a pop up 'Comment can not be empty'


