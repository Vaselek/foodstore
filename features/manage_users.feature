Feature: Manage Users
	In order to make application
	As an admin
	I want to create, destroy and edit users


	Scenario: Read User List
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		When I go to the list of users
		Then I should see user with name "Asel"

	Scenario: Create Valid User
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I am on the list of user
		When I follow "New User"
		And I fill in name with "Ivan", email with "ivan@mail.ru", password with "ivanivan", password confirmation with "ivanivan", phone with "333-333-333" and address with "mrd. Ivan"
		Then I should see "New user created"
		And I should see that his email is "ivan@mail.ru", phone is "333-333-333" and address is "mrd. Ivan"
	
	@javascript
	Scenario: Destroy User
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I am on the list of user
		When I follow "Delete" for the user with css id "user_1"
		And I confirm action in a pop-up window
		Then I should see "User was successfully destroyed."
	
	Scenario: Edit User
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I am on the list of user
		When I follow "Edit" for the user with css id "user_1"
		And I fill in name with "Ivan", email with "ivan@mail.ru", password with "ivanivan", password confirmation with "ivanivan", phone with "333-333-333" and address with "mrd. Ivan"
		And I press "Update User"
		Then I should see "User was successfully updated."
		And I should see that his email is "ivan@mail.ru", phone is "333-333-333" and address is "mrd. Ivan"

	Scenario: View User
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I am on the list of user
		When I follow "View" for the user with css id "user_1"
		Then I am on the view page of user with id 1
		



