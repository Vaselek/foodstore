Feature: Manage Shops
	In order to make application
	As an admin
	I want to create, destroy and edit shops


	Scenario: Read Shop List
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have shop titled "Namba"
		When I go to the list of shops
		Then I should see "Namba"

	Scenario: Create Valid Shop
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have 8 shops
		And I am on the list of shop
		When I follow "New Shop"
		And I fill in title with "Nambafood"
		And I fill in description with "Nice place"
		And I attach file
		And I press "Create"
		Then I should see "New shop created"
		And I should see "Nambafood"
		And I should see "Nice place"
		And I should have 9 shops

	Scenario: Destroy Shop
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have 8 shops
		And I am on the list of shop
		When I follow "Delete" for the shop with id "shop_1"
		And I confirm action in a pop-up window
		Then I should see "Shop was successfully destroyed."

	@javascript
	Scenario: Edit Shop
		Given I signed up with email "asel@mail.ru" and password "jkljkl"
		And I have 8 shops
		And I am on the list of shop
		When I follow "Edit" for the shop with id "shop_1"
		And I fill in title with "Nambafood edited"
		And I fill in description with "Nice place edited"
		And I attach file
		And I press "Update Shop"
		Then I should see "Shop was successfully updated."
		And I should see "Nambafood edited"
		And I should see "Nice place edited"
		



