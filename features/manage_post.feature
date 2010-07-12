Feature: manage post
  As a blog owner
  I can manage my blog

  Scenario: Add tinymce to new posts   
    Given I am logged in as a user
    And I am on the post page
    And I follow "New post"
    And I fill in "Title" with "title"
    And I fill in "Scontent" with "content"
    And I fill in "Scontent" with "tinymce"
    When I press "Save"
    Then I should be able to create new post with tinymce

  Scenario: View draft list
    Given I am logged in as a user
    And I am on the post page
    When I follow "Draft list"
    Then I should see "Draft"
    When I follow "Back to List of Post"
    Then I should see "Listing posts"

  Scenario: Add tag to existing post
    Given I have a post titled "Post"
    And I am on the post page
    Then I should see "Show"
      

