Feature: Category page

	As a student
	I want to know more information about of a specific category
	So that I can learn more about what I want.

Background: categories and articles in database
	
	Given the following category exist:
	|name		|description            	|id     |parent |
	|test_cat_1	|This is for test		|1      |0      |
	|test_cat_2	|For test			|2      |1      |
	|test_cat_3	|Test				|3      |1      |

	Given the following article exist:
	|title              |author             |category	|
	|test_art_1         |Andy		|test_cat_1	|
	|test_art_2	    |Andy		|test_cat_2	|
	|test_art_3	    |Andy		|test_cat_1	|
	|test_art_4	    |Andy		|test_cat_3	|
	|test_art_5	    |Andy		|test_cat_2	|
	|test_art_6	    |Bill		|test_cat_1	|
	|test_art_7	    |Bill		|test_cat_1	|

Scenario: display all related articles
        When I am on a category test_cat_1 page
	When I follow "test_cat_1"
	Then I should see the following displayed: test_art_1, test_art_3, test_art_6
	When I follow "test_cat_2"
	Then I should see the following displayed: test_art_2, test_art_5

Scenario: Display a brief of the article
        When I am on a category test_cat_2 page
	When I follow "test_cat_1"
	Then I should see the following displayed: test_art_1, test_art_3

Scenario: Display subcategories
        When I am on a category test_cat_1 page
        Then I should see the following displayed: test_cat_2, test_cat_3

