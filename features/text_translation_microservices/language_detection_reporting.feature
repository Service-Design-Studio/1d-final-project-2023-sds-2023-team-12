Feature: (Automatic Language Detection) Automatic translation of non-English-provided information for reporting case 

  As a user who are not good writing English
  I want my information provided to the form to be automatically translated to English
  So that the community and general public can easily understand the information in post, which will assist in investigation and searching process

Background: I want to report a missing case when i am already logged in
  Given I am logged in
  And I am on the "Home" page
  Then I click on "Report Case" button in navigation bar
  Then I should see "Create Case"

@happy_path
Scenario: Report a new case with description and special note fully filled by English 
  Given I am on the "Report Case" page for user with email: "test@example.com"
  Then I should see the "Post" form with the following fields: full_name, age, location, description, special_note, missing_time, avatar
  When I fill in "Full name" field with "David"
  And I fill in "Age" field with "34"
  And I fill in "Location" field with "Changi"
  And I fill in "Description" field with "Wearing a red T shirt"
  And I fill in "Special note" field with "elderly"
  And I fill in "Missing time" field with "Sat, 17 Jun 2023 21:33:00 +0000"
  And I fill in "image" field with valid image
  And I click on the "Create Post" button
  Then I should be on the "Missing Case Detail" page for post with name: "David"
  And I should see notification "Post was successfully created, click on show cases to see your case"
  And I should not see "Description has been translated from Vietnamese to English"

Scenario: Report a new case with the description provided in a non-English language
  Given I am on the "Report Case" page for user with email: "test@example.com"
  And I should see the "Post" form with the following fields: full_name, age, location, description, special_note, missing_time, avatar
  When I fill in "Full name" field with "David"
  And I fill in "Age" field with "34"
  And I fill in "Location" field with "Changi"
  And I fill in "Description" field with "Khi mất tích, anh ấy mặc chiếc áo thun màu đen Uniqlo, tóc ngắn nhuộm màu nâu, chiều cao 1m75, quần jean màu xanh và giày thế thao Adidas"
  And I fill in "Special note" field with "elderly"
  And I fill in "Missing time" field with "Sat, 17 Jun 2023 21:33:00 +0000"
  And I fill in "image" field with valid image
  And I click on the "Create Post" button
  Then I should be on the "Missing Case Detail" page for post with name: "David"
  And I should see "When he went missing, he was wearing a black Uniqlo t-shirt, short brown hair, a height of 1m75, blue jeans and Adidas sneakers."
  And I should see notification "Post was successfully created, click on show cases to see your case"
  And I should see notification "Description has been translated from Vietnamese to English"

Scenario: Report a new case with the description provided in a non-English language
  Given I am on the "Report Case" page for user with email: "test@example.com"
  And I should see the "Post" form with the following fields: full_name, age, location, description, special_note, missing_time, avatar
  When I fill in "Full name" field with "David"
  And I fill in "Age" field with "34"
  And I fill in "Location" field with "Changi"
  And I fill in "Description" field with "Khi mất tích, anh ấy mặc chiếc áo thun màu đen Uniqlo, tóc ngắn nhuộm màu nâu, chiều cao 1m75, quần jean màu xanh và giày thế thao Adidas"
  And I fill in "Special note" field with "Người già và trí nhớ kém"
  And I fill in "Missing time" field with "Sat, 17 Jun 2023 21:33:00 +0000"
  And I fill in "image" field with valid image
  And I click on the "Create Post" button
  Then I should be on the "Missing Case Detail" page for post with name: "David"
  And I should see "When he went missing, he was wearing a black Uniqlo t-shirt, short brown hair, a height of 1m75, blue jeans and Adidas sneakers."
  And I should see "Old people and poor memory"
  And I should see notification "Post was successfully created, click on show cases to see your case"
  And I should see notification "Description has been translated from Vietnamese to English"
  And I should see notification "Special Note has been translated from Vietnamese to English"


Scenario: Edit an existing case with information shown in original language 
  Given I am on "Edit" page for a particular post
  Then I should see "Khi mất tích, anh ấy mặc chiếc áo thun màu đen Uniqlo, tóc ngắn nhuộm màu nâu, chiều cao 1m75, quần jean màu xanh và giày thế thao Adidas" for "description" field
  And I should see "Người già và trí nhớ kém" for "special note" field
  Then I update "Description" field with "Khi mất tích, anh ấy mặc chiếc áo thun màu đen Uniqlo, tóc ngắn nhuộm màu nâu, chiều cao 1m85, quần jean màu xanh và giày thế thao Adidas"
  And I update "Special note" field with "Người già và trí nhớ tốt"
  And I click on the "Update Post" button
  Then I should be on the "Missing Case Detail" page for post with name: "David"
  And I should see notification "When he went missing, he was wearing a black Uniqlo t-shirt, short brown hair, 1.85m tall, blue jeans and Adidas sneakers."
  And I should see "Old people and good memory"
  And I should see notification "Post was successfully created, click on show cases to see your case"
  And I should see notification "Description has been translated from Vietnamese to English"
  And I should see notification "Special Note has been translated from Vietnamese to English"