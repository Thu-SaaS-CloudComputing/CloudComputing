Feature: Edit Lesson Table page
	As an admin,
	I want to edit lessons,
	So that I can change lesson table

Background: lessons in database:

	Given the following lesson exist:
	|name       |column    |row     |classroom  |department    |
	|lesson_1   |1         |3       |117        |department_1  |
	|lesson_2   |2         |2       |112        |department_1  |
	|lesson_3   |1         |3       |115        |department_2  |
	|lesson_4   |3         |5       |116        |department_2  |
	|lesson_5   |4         |2       |118        |department_3  |
        Given I have already logged in
	And I am on the edit lesson table page 
Scenario: Add new lesson
	When I follow "Add new lesson"
	Then I should see "Unknown"

Scenario: Edit lesson
	When I follow "lesson_1_edit"
	Then I fill in "Name" with "lesson_6"
	Then I press "Update Lesson Info"
	Then I should not see "lesson_1"
	And I should see "lesson_6"

Scenario: Delete lesson
	When I follow "lesson_1_delete"
	Then I should not see "lesson_1"

Scenario: Sorted by Classroom
	When I follow "Sorted by Classroom"
	Then I should see the following displayed in the block of 117: lesson_1
	And I should see the following displayed in the block of 112: lesson_2
	And I should see the following displayed in the block of 115: lesson_3
	And I should see the following displayed in the block of 116: lesson_4
	And I should see the following displayed in the block of 118: lesson_5

Scenario: Sorted by Department
	When I follow "Sorted by Department"
	Then I should see the following displayed in the block of department_1: lesson_1, lesson_2
	And I should see the following displayed in the block of department_2: lesson_3, lesson_4
	And I should see the following displayed in the block of department_3: lesson_5

Scenario: Unsorted
	When I follow "Unsorted"
	Then I should see the following displayed in the block of All Lessons: lesson_1, lesson_2, lesson_3, lesson_4, lesson_5
