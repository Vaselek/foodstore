Feature: Manage Carts
  In order to make application
  As an admin
  I want to create, destroy and edit carts

  Scenario: Read Cart List
    Given I signed up with email "asel@mail.ru" and password "jkljkl"
    And I have cart with id 1
    When I go to the list of carts
    Then I should see cart with css id "cart_1"

  @javascript
  Scenario: Destroy Cart
    Given I signed up with email "asel@mail.ru" and password "jkljkl"
    And I have cart with id 1
    When I go to the list of carts
    And I follow "Delete" for the cart with css id "cart_1"
    And I confirm action in a pop-up window
    Then I should see "Cart was successfully destroyed."
  
  Scenario: Edit 
    Given I signed up with email "asel@mail.ru" and password "jkljkl"
    And I have cart with id 1
    And I go to the list of carts
    When I follow "Edit" for the cart with css id "cart_1"
    And I select option "Asel" from "cart[user_id]"
    And I select option "Namba" from "cart[shop_id]"
    And I press "Update Cart"
    Then I should see "Cart was successfully updated."
    
  Scenario: View Cart
    Given I signed up with email "asel@mail.ru" and password "jkljkl"
    And I have cart with id 1
    And I go to the list of carts
    When I follow "View" for the cart with css id "cart_1"
    Then I am on the view page of cart with id 1
    



