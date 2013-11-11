Feature:
	As the admin
	I want to a article edit page
	So that I can post new articles and edit existed articles if needed

Background:
        Given the following category exist:
        |name     |description       |
        |cat_1    |haha              |
        |cat_2    |haha              |

        Given the following article exist:
        |title    |author   |category   |content           |
        |art_1    |Andy     |cat_1      |content for art_1 |
        |art_2    |Bob      |cat_1      |content for art_2 |
        |art_3    |Charle   |cat_2      |content for art_3 |
        |art_4    |David    |cat_2      |content for art_4 |
	
Scenario: post new articles
	Given I am on the new page
	Given I fill in "title" with "art_5"
	Then I fill in "author" with "EEE"
	Then I fill in "category" with "cat_1"
	Then I fill in "content" with "1234567"
	Then I follow "Save"
	Then I should see "art_5" in "cat_1"

Scenario: edit existed articles
	Given I am on the edit page of "art_1"
	Given I fill in "title" with "art_5"
	Then I fill in "category" with "cat_2"
	Then I follow "Save"
	Then I should see "art_5" in "cat_2"
	And I should not see "art_1" in "cat_1"
