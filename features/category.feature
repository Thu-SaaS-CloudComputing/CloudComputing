Feature: Category page
	As a student
	I want to know more information about of a specific category
	So that I can learn more about what I want.

Background: 
	
	Given the following category exist:
	|name		|description	|
	|test_cat_1	|This is for test	|
	|test_cat_2	|For test		|
	|test_cat_3	|Test			|

	Given the following article exist:
	|title	|creat_date	|author	|category	|
	|test_art_1	|1-Nov-2013	|Andy		|test_cat_1	|
	|test_art_2	|2-Nov-2013	|Andy		|test_cat_2	|
	|test_art_3	|3-Nov-2013	|Andy		|test_cat_1	|
	|test_art_4	|4-Nov-2013	|Andy		|test_cat_3	|
	|test_art_5	|5-Nov-2013	|Andy		|test_cat_2	|
	|test_art_6	|6-Nov-2013	|Bill		|test_cat_1	|
	|test_art_7	|7-Nov-2013	|Bill		|test_cat_3	|

	And I am on a category page

Scenerio: display all related articles
	When I follow "test_cat_1"
	Then I should see following displayed: "test_art_1", "test_art_3", "test_art_6"
	When I follow "test_cat_2"
	Then I should see following displayed: "test_art_2", "test_art_5"

Scenerio: Display a brief of the article
	When I follow "test_cat_1"
	Then I should see the following displayed: "title", "creat_date", "author", "category"


