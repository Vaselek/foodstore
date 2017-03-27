Feature: Registration and log in

  In order to make purchaces
  A user
  Should be able to registrate and log in to website

  Scenario: User make registration

    Given I signed up with email "user1@mail.ru" and password "jkljkl"
    Then I should see "Вы вошли на сайт!"

  Scenario: Create Valid User
		When I follow "Sign up" button
		And I fill in name with "Ivan", email with "ivan@mail.ru", password with "ivanivan", password confirmation with "ivanivan", phone with "333-333-333" and address with "mrd. Ivan"
		And I press "Sign up"
		Then I should see "Welcome! You have signed up successfully."
		