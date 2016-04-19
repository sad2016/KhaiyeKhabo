Feature: AddComment

  I want to comment on a recipe

  Scenario: Comment on a recipe

    Given I am signed in as admin/member
    Then I should see a link to View Recipe
    And I should click on the View Recipe link
    And I should see a list of uploaded recipes
    When I click on a recipe from the list
    Then I should see a recipe
    Then I should see a form to add a comment
    When I add the comment
    Then I should see my comment added to that recipe