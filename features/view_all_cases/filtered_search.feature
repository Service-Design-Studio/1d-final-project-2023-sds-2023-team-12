Feature: Filtered Search

    @happy_path
    Scenario: User has no filters or search queries
        Given the following posts exist:
            | full_name   | age | location    | description       | special_note | missing_time       | created_at          | reward |
            | Louis Tran  | 18  | Tampines    | test description  | nil          | 2022-07-02 21:00   | 2022-07-03 09:00    | 54     |
            | Ayu Permata | 5   | Tanah Merah | test              | nothing      | 2022-09-02 21:00   | 2022-09-03 09:00    | 29     |
            | Yi Xuan     | 62  | Kembangan   | description       | nada         | 2022-06-02 21:00   | 2022-07-04 09:00    | 89     |
        When I visit the posts page
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        | reward |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  | 54     |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  | 29     |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  | 89     |

    @happy_path
    Scenario: User searches for posts with specific age categories
        Given the following posts exist:
            | full_name   | age | location    | description       | special_note | missing_time       | created_at          | reward |
            | Louis Tran  | 18  | Tampines    | test description  | nil          | 2022-07-02 21:00   | 2022-07-03 09:00    | 54     |
            | Ayu Permata | 5   | Tanah Merah | test              | nothing      | 2022-09-02 21:00   | 2022-09-03 09:00    | 29     |
            | Yi Xuan     | 62  | Kembangan   | description       | nada         | 2022-06-02 21:00   | 2022-07-04 09:00    | 89     |
        When I visit the posts page
        When I visit the posts page
        And I check the "youth" age category
        And I click "Search"
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        | reward |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  | 54     |

    @happy_path
    Scenario: User searches for posts with a search query
        Given the following posts exist:
            | full_name   | age | location    | description       | special_note | missing_time       | created_at          | reward |
            | Louis Tran  | 18  | Tampines    | nada              | nil          | 2022-07-02 21:00   | 2022-07-03 09:00    | 54     |
            | Ayu Permata | 5   | Tanah Merah | test              | nothing      | 2022-09-02 21:00   | 2022-09-03 09:00    | 29     |
            | Yi Xuan     | 62  | Kembangan   | description       | nada         | 2022-06-02 21:00   | 2022-07-04 09:00    | 89     |
        When I visit the posts page
        And I fill in "search" with "nada"
        And I click "Search"
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        | reward |
            | Louis Tran | 18     | Tampines    | nada               | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  | 54     |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  | 89     |

    @happy_path
    Scenario: User searches for posts with specific age categories and a search query
        Given the following posts exist:
            | full_name   | age | location    | description       | special_note | missing_time       | created_at          | reward |
            | Louis Tran  | 18  | Tampines    | test description  | nil          | 2022-07-02 21:00   | 2022-07-03 09:00    | 54     |
            | Ayu Permata | 5   | Tanah Merah | test              | nothing      | 2022-09-02 21:00   | 2022-09-03 09:00    | 29     |
            | Yi Xuan     | 62  | Kembangan   | description       | nada         | 2022-06-02 21:00   | 2022-07-04 09:00    | 89     |
        When I visit the posts page
        And I fill in "search" with "test"
        And I check the "children" age category
        And I click "Search"
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        | reward |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  | 29     |

    @sad_path
    Scenario: User searches for posts with specifc age but has no results
    Given the following posts exist:
            | full_name   | age | location    | description       | special_note | missing_time       | created_at          | reward |
            | Louis Tran  | 18  | Tampines    | test description  | nil          | 2022-07-02 21:00   | 2022-07-03 09:00    | 54     |
            | Ayu Permata | 5   | Tanah Merah | test              | nothing      | 2022-09-02 21:00   | 2022-09-03 09:00    | 29     |
    When I visit the posts page
    And I check the "senior" age category
    Then I should see "No cases available"
        

            

    



        
