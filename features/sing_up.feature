Feature: User sign up
  In order to use the application a user must create a account(sign up)

  Scenario: Creating a user
    Given I am in the sign up page
    When I fill all fields in form
    And click in "Sign Up"
    Then a new user must be created
    And I should be redirected to the homepage
