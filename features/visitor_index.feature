Feature: Visitor Index

  As a visitor to the website
  I want to see all categories and brief contents of each category in blocks
  So that I can find the contents I'm intereted in

Background:
  Given the following category exist:
        |name        |description      |id     |parent |show_on_index |
        |test_cat_1  |This is for test |1      |0      |shown         |
        |test_cat_2  |For test         |2      |1      |unavailable   |
        |test_cat_3  |Test             |3      |1      |unavailable   |
        |test_cat_4  |Test             |4      |0      |shown         |
        |test_cat_5  |Test             |5      |0      |shown         |
        |test_cat_6  |Test             |6      |5      |unavailable   |

        Given the following article exist:
        |title             |author |category          |
        |test_art_1        |Andy   |test_cat_1        |
        |test_art_2        |Andy   |test_cat_2        |
        |test_art_3        |Andy   |test_cat_1        |
        |test_art_4        |Andy   |test_cat_3        |
        |test_art_5        |Andy   |test_cat_2        |
        |test_art_6        |Bill   |test_cat_1        |
        |test_art_7        |Bill   |test_cat_1 |
        |test_art_8        |Kevin  |test_cat_4 |
        |test_art_9        |Kevin  |test_cat_4 |
        |test_art_10       |Kevin  |test_cat_5 |
        |test_art_11       |Kevin  |test_cat_5 |
        |test_art_12       |Kevin  |test_cat_6 |
        
Scenario: display all top level categories
  Given I am on the visitor index page
  Then I should see the following displayed in the navigator: test_cat_1, test_cat_4, test_cat_5
  And I should not see the following displayed in the navigator: test_cat_2, test_cat_3, test_cat_6

Scenario: display brief content of each category in blocks
  Given I am on the visitor index page
  Then I should see the following displayed in the block of test_cat_1: test_art_1, test_art_3, test_art_6, test_cat_2, test_cat_3
  And I should see the following displayed in the block of test_cat_4: test_art_8, test_art_9
  And I should see the following displayed in the block of test_cat_5: test_art_10, test_art_11, test_cat_6
