  Feature: User signup
  In order to login
  User wants to signup and have an account

  Scenario: Register new signup
    Given I am on the homepage
    And I follow "Register"
    And I fill in the following:
      | Login            | user_test |
      | Email            | user@example.com |
      | Password         | mouse321        |
      | Password confirmation | mouse321 |
    And I attach the file "features/support/800px-Paperclip-01_(xndr).jpg" to "Photo"
    When I press "Save"
    Then I should see "Account registered!"

  Scenario: Check for too short email address during signup
    Given I go to the homepage
    And I follow "Register"
    And I fill in "Login" with "homer"
    And I press "Save"
    Then I should see "Email is too short (minimum is 6 characters)"

  Scenario: Checking the password confirmation
    Given I go to the homepage
    And I follow "Register"
    And I fill in "Login" with "homer"
    And I fill in "Email" with "homer@simpsons.com"
    And I fill in "Password" with "homer_rocks"
    And I fill in "Password confirmation" with "xhomer_rocks"
    When I press "Save"
    Then I should see "Password doesn't match confirmation"

  Scenario: Check for invalid email address during signup
    Given I go to the homepage
    And I follow "Register"
    And I fill in "Login" with "homer"
    And I fill in "Email" with "homer-simpsons.com"
    When I press "Save"
    Then I should see "Email should look like an email address"
