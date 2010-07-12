Feature: View blog
  As a user
  I can view my blog
  So that I can read it

  Background:
    Given a user with the login "homer" exists

  Scenario: View blog
    Given I go to the homepage
    And I follow "Log In"
    And I fill in "Login" with "homer"
    And I fill in "Password" with "simpson312"
    When I press "Submit"
    Then I should be on the account page
    And I should see "My Blog"
    When I follow "My Blog"
    Then I should be on the post page
    And I should see "Listing posts"
    And I should see "Title"
    And I should see "Content"
    And I should see "User"

