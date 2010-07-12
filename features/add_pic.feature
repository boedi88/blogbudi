Feature: Create posting
  As a Blog Owner
  I can create a post

  Background:
    Given a user with the login "homer" exists
 
  Scenario: Create posting
    Given I go to the homepage
    And I follow "Log In"
    And I fill in "Login" with "homer"
    And I fill in "Password" with "simpson312"
    When I press "Submit"
    Then I should be on the account page
    Then I should see "My Blog"
    When I follow "My Blog"
    Then I should be on the post page
    And I should see "Listing posts"
    And I should see "Title"
    And I should see "Content"
    And I should see "User"
    When I follow "New post"
    And I fill in the following:
      | Title            | user_test |
      | Scontent            | first posting |
      | Tag list         | development  |
      | Category       | development |
    And I attach the file "features/support/PaperClip-Grey-300x296.jpg" to "Photo"
    When I press "Save"
    Then I should see "Post was successfully created."
    When I follow "Back"
    Then I should be on the post page
    When I follow "Back"
    Then I should be on the account page

  Scenario: Check for existence of title
    Given I go to the homepage
    And I follow "Log In"
    And I fill in "Login" with "homer"
    And I fill in "Password" with "simpson312"
    When I press "Submit"
    Then I should be on the account page
    Then I should see "My Blog"
    When I follow "My Blog"
    Then I should be on the post page
    And I should see "Listing posts"
    And I should see "Title"
    And I should see "Content"
    And I should see "User"
    When I follow "New post"
    And I fill in "Title" with ""
    And I press "Save"
    Then I should see "Title can't be blank"

  Scenario: Check for the type of attachment
    Given I go to the homepage
    And I follow "Log In"
    And I fill in "Login" with "homer"
    And I fill in "Password" with "simpson312"
    When I press "Submit"
    Then I should be on the account page
    Then I should see "My Blog"
    When I follow "My Blog"
    Then I should be on the post page
    And I should see "Listing posts"
    And I should see "Title"
    And I should see "Content"
    And I should see "User"
    When I follow "New post"
    And I fill in "Title" with "test 1"
    And I press "Save"
    Then I should see "Photo content type is not one of image/jpeg, image/png"

