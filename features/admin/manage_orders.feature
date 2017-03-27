Feature: Manage Orders
	In order to make application
	As an admin
	I want to create, destroy and edit orders

	Scenario: Read Order List
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have order with id 1
		When I go to the list of orders
		Then I should see order with css id "order_1"

	@javascript
	Scenario: Destroy Order
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have order with id 1
		When I go to the list of orders
		And I follow "Delete" for the order with css id "order_1"
		And I confirm action in a pop-up window
		Then I should see "Order was successfully destroyed."
	
	Scenario: Edit Order
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have order with id 1
		And I am on the list of order
		When I follow "Edit" for the order with css id "order_1"
		And I select option "Asel" from "order[user_id]"
		And I select option "Namba" from "order[shop_id]"
		And I press "Update Order"
		Then I should see "Order was successfully updated."
		
	Scenario: View Order
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have order with id 1
		And I am on the list of order
		When I follow "View" for the order with css id "order_1"
		Then I am on the view page of order with id 1
		



