Feature: User Management
  As the administrator
  I want to manage all the priviledges of users
  So that it is more clear and secured.
  
Background: users, priviledges, priviledges_database and users in database
  
  Given the following users exist:
    |name     |studentID      |id |
    |user_1   |2012012429     |1  |
    |user_2   |2012012428     |2  |
    |user_3   |2012012427     |3  |
    
  Given the following priviledges exist:
    |name                         |description      |id |
    |edit_category_cat_1          |Empty            |1  |
    |delete_category_cat_1        |Empty            |2  |
    |add_articles_under_cat_1     |Empty            |3  |
    |edit_articles_under_cat_1    |Empty            |4  |
    |delete_articles_under_cat_1  |Empty            |5  |
    |edit_category_cat_2          |Empty            |6  |
    |delete_category_cat_2        |Empty            |7  |
    |add_articles_under_cat_2     |Empty            |8  |
    |edit_articles_under_cat_2    |Empty            |9  |
    |delete_articles_under_cat_2  |Empty            |10 |
    |edit_any_category            |Empty            |11 |
    |delete_any_category          |Empty            |12 |
    |add_atricles_anywhere        |Empty            |13 |
    |edit_atricles_anywhere       |Empty            |14 |
    |delete_atricles_anywhere     |Empty            |15 |
    
  Given the following priviledges_users exist:
    |priviledge_id  |user_id  |
    |1              |1        |
    |2              |1        |
    |3              |1        |
    |4              |1        |
    |5              |1        |
    |6              |2        |
    |7              |2        |
    |8              |2        |
    |9              |2        |
    |10             |2        |
    |11             |3        |
    |12             |3        |
    |13             |3        |
    |14             |3        |
    |15             |3        |
    
  Given I have already logged in
    
  Scenario: display all users
    When I am on the user management page
    Then I should see names and studentIDs of the following users: user_1, user_2, user_3
  
  Scenario: see the detailed informations and priviledges of users
    When I am on the user management page
    And I follow detail of user_1
    Then I should be on user_1 detail page
    And I should see the following displayed: user_1, 2012012429
    And I should see "off" displayed in the following priviledges: edit_category_cat_2, delete_category_cat_2, add_articles_under_cat_2, edit_articles_under_cat_2, delete_articles_under_cat_2
    And I should see "on" displayed in the following priviledges: edit_category_cat_1, delete_category_cat_1, add_articles_under_cat_1, edit_articles_under_cat_1, delete_articles_under_cat_1
    And I should see all priviledges displayed
    
  Scenario: change the priviledges of users
    When I am on user_1 detail page
    Then I should see "off" displayed in the following priviledges: edit_category_cat_2, delete_category_cat_2, add_articles_under_cat_2, edit_articles_under_cat_2, delete_articles_under_cat_2
    When I follow "off" in switch of priviledge edit_category_cat_2
    Then I should see "on" displayed in the following priviledges: edit_category_cat_2
    
