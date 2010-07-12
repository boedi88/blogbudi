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
    And I am on the show draft post page
    Then I should see "Edit"
    When I follow "Edit"
    And I fill in "Tag list" with "New"
    And I press "Save as Draft"
    Then I should see "Post was successfully updated."

  Scenario: Publish a post
    Given I have a post titled "Post"
    And I am on the show draft post page
    Then I should see "The post state is draft"
    And I should see "Published the post"
    When I follow "Published the post"
    Then I should see "Listing posts"

  Scenario: Save a post as draft
    Given I have a post titled "Post"
    And I am on the show draft post page
    Then I should see "The post state is published"
      

