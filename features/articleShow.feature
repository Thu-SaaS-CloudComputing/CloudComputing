Feature:
        As a user
        I want to see the details of the article
        so that I can learn what the article is about

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

Scenario: display top level categories
          When I am on an article art_1 page
          Then I should see the following displayed: cat_1, cat_2
          When I follow "cat_1"
          Then I am on a category cat_1 page

#Scenario: display the content of an article
#          When I am on an article art_1 page
#          Then I should see the following displayed: content for art_1, Andy
