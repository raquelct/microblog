Feature: User sign in
  In order to use the application a user must login(sign in)
  I can use my username or email and password

    Scenario: Must fill the sign_in form with username and password and login with success
      Given that I am on the sign_in page
      When I fill in my username and password
      And click in "Sign In"
      Then I should see the user name in the page
      And the "Log Out" button to logout from the system

    Scenario: Must fill the sign_in form with email and password and login with success
      Given that I am on the sign_in page
      When I fill in my email and password
      And click in "Sign In"
      Then I should see the user name in the page
      And the "Log Out" button to logout from the system
