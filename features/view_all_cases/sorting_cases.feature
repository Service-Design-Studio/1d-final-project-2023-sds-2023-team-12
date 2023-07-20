Feature: Sorting Cases

    Scenario: User does not click any sorting configuration (default: most recently posted)
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        Then I should see the following posts in order:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |

    Scenario: User sorts posts by Most Recently Missing
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        And I select "Most Recently Missing" from "Sort By"
        Then I should see the following posts in order:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |

    Scenario: User sorts posts by Alphabetical Order
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        And I select "Alphabetical Order" from "Sort By"
        Then I should see the following posts in order:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |

    Scenario: User sorts posts by Most Recently Posted
        Given the following posts exist:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
        When I visit the posts page
        And I select "Most Recently Posted" from "Sort By"
        Then I should see the following posts in order:
            | full_name  | age    | location    | description        | special_note  | missing_time     | created_at        |
            | Cephas Yeo | 23     | Tanah Merah | test               | nothing       | 2022-09-02 21:00 | 2022-09-03 09:00  |
            | Senna Lim  | 20     | Kembangan   | description        | nada          | 2022-06-02 21:00 | 2022-07-04 09:00  |
            | Nada Khan  | 21     | Tampines    | test description   | nil           | 2022-07-02 21:00 | 2022-07-03 09:00  |
