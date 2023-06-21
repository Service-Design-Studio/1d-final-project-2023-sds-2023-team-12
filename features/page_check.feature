Feature: Checking buttons and messages are present on each page

  Scenario: Check landing page features before log in
    Given I am on the page with path: 'home'
    Then I should see 'Report Case' button
    Then I should see 'Sign In' button
    Then I should see 'Sign Up' button
    Then I should see a message 'Provides a decentralized and streamlined access to consolidated data for more efficient search efforts for both authorities and the general public'

    
Scenario: Check landing page features after log in
    Given I am on the page with path: 'home'
    And I am logged in
    Then I should see 'My Cases' button
    Then I should see 'Profile' button
    Then I should see 'Sign Out' button
    Then I should see a message 'Provides a decentralized and streamlined access to consolidated data for more efficient search efforts for both authorities and the general public'

Scenario: Check landing page features after log in
    Given I am on the page with path: 'report_case'
    Then I should see 'Create Case' button
    Then I should see a message 'Create Case'
    Then I should see a message 'Full Name'