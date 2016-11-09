Feature: User sign out
    To sign out from the application
    As an user
    I should click in the sign out button and be redirected to the homepage

  Scenario: Log out
    Given that I have signed in
    When I click in the "Log Out" link
    Then I should be redirected to the homepage
