Feature: Category Edit page

	As an admin,
	I want to edit category,
	So that I can change category list.

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
	And I am on the edit categary page

Scenario: Insert Top Category
	When I follow "Insert Top Category"
	Then I should see "(new category)" with "0" being its parent

Scenario: Edit Category
	When I follow "test_cat_1_edit"
	Then I fill in "Name" with "lalala"
	Then I press "Update Category Info"
#	Then I should be on the edit category page
	Then I should see "lalala"
	And I should not see "test_cat_1"

Scenario: Change Category List
	When I follow "test_cat_3_up"
	Then I should see "test_cat_3" before "test_cat_2"
	Then I follow "test_cat_3_down"
	Then I should see "test_cat_2" before "test_cat_3"

Scenario: Delete Category
	When I follow "test_cat_2_-"
	Then I should not see "test_cat_2"

