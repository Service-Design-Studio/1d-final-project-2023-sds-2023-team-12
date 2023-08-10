Feature: Sorting Cases
As a general public user,
I want to be able to display cases based on certain filters
So that I can better navigate and browse through missing people cases

Background: 
Given the following posts exist:
    |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
    |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
    |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
    | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |
    |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |

    Scenario: User does not click any sorting configuration (default: most recently posted)
        When I visit the posts page
        Then I should see the following posts in order:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
            |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
            | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |
            |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |

    Scenario: User sorts posts by Most Recently Missing
        When I visit the posts page
        And I select "Most Recently Missing" from "sort_by"
        Then I should see the following posts in order:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |
            |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
            |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
            |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |

    Scenario: User sorts posts by Alphabetical Order
        When I visit the posts page
        And I select "Alphabetical Order" from "sort_by"
        Then I should see the following posts in order:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
            |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |
            |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
            | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |

    Scenario: User sorts posts by Most Recently Posted
        When I visit the posts page
        And I select "Most Recently Posted" from "sort_by"
        Then I should see the following posts in order:
            |    full_name |   age | location      | description          | special_note   | missing_time            |reward     |
            |   Lucas Lim  |    25 | Orchard Road  | Random description   | None           | Sun, 18 Jun 2023 21:33  | 100       |
            |  Amanda Poh  |    27 | Tampines      | Blue shirt           | Autistic       | Mon, 19 Jun 2023 21:33  | 100       |
            | Richard Soon |    90 | Geylang       | Adidas shirt         | Elderly        | Tues, 20 Jun 2023 21:33 | 100       |
            |   James Koh  |    30 | Jurong Point  | Missing person desc  | Important note | Sat, 17 Jun 2023 21:33  | 100       |
