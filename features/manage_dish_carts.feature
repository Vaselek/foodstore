Feature: Create dish_carts

  In order to make purchaces
  A user
  Should be able to add dishes to a cart

  Scenario: Add dish to a cart by user

    Given I signed up with email "user1@mail.ru" and password "jkljkl"
    When I add dish "Manty" with id "22" and price "80"
    Then I should see that "Manty" appeared in cart
