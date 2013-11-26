Feature: Admin page

	As an admin,
	I want to have access to Edit Categary page and Edit Lesson Table Page,
	So that I can edit them.

Background: categories and articles in database
	
	Given the following category exist:
	|name		|description            |id     |parent |
	|test_cat_1	|This is for test	|1      |0      |
	|test_cat_2	|For test		|2      |1      |
	|test_cat_3	|Test			|3      |1      |

	Given the following article exist:
	|title	        |author 	|category	|
	|test_art_1	|Andy		|test_cat_1	|
	|test_art_2	|Andy		|test_cat_2	|
	|test_art_3	|Andy		|test_cat_1	|
	|test_art_4	|Andy		|test_cat_3	|
	|test_art_5	|Andy		|test_cat_2	|
	|test_art_6	|Bill		|test_cat_1	|
	|test_art_7	|Bill		|test_cat_1     |
        Given I have already logged in
	And I am on the admin page

Scenario: Have access to edit categary page
        When I follow "Edit Categary"
	Then I should be on the edit categary page

Scenario: Have access to edit lesson table page
        When I follow "Edit Lesson Table"
	Then I should be on the edit lesson table page


