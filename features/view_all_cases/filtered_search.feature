Feature: Filtered Search

    Scenario: User has no filters or search queries
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |

    Scenario: User searches for posts with specific age categories
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        And I check the "youth" age category
        And I click "Filter"
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |


    Scenario: User searches for posts with a search query
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | nada               | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        And I fill in "search" with "nada"
        And I click "Filter"
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | nada               | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |

    Scenario: User searches for posts with specific age categories and a search query
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Louis Tran | 18     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Yi Xuan    | 62     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        And I fill in "search" with "test"
        And I check the "children" age category
        And I click "Filter"
        Then I should see the following posts:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Ayu Permata| 5      | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            

    



        
