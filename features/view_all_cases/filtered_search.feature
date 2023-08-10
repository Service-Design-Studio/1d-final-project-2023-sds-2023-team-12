Feature: Filtered Search
As a general public user,
I want to be able to display cases based on certain filters
So that I can better navigate and browse through missing people cases

Background: 
Given the following posts exist:
    |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
    |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |
    |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
    |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
    | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |

    @happy_path
    Scenario: User has no filters or search queries
        When I visit the posts page
        Then I should see the following posts:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |
            |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
            |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
            | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |

    
    @happy_path
    Scenario: User searches for posts with a search query
        When I visit the posts page
        And I fill in "search" with "Missing"
        And I click "Search"
        Then I should see the following posts:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |
            
    @happy_path
    Scenario: User searches for posts with specific age categories and a search query
        When I visit the posts page
        And I fill in "search" with "shirt"
        And I check the "senior" age category
        And I click "Search"
        Then I should see the following posts:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |


    @sad_path
    Scenario: User searches for posts with specifc age but has no results
    When I visit the posts page
    And I check the "children" age category
    Then I should see the message "No cases available"

    @sad_path
    Scenario: User searches for posts with specifc keyword but has no results
    When I visit the posts page
    And I fill in "search" with "Cephas"
    Then I should see the message "No cases available"


    @sad_path
    Scenario: User searches for posts with specific age categories
        When I visit the posts page
        When I visit the posts page
        And I check the "youth" age category
        And I click "Search"
        Then I should see the message "No cases available"

        

            

    



        
