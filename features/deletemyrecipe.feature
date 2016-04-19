Feature: DeleteMyRecipe

  I want to delete my own recipes

  Scenario: Delete My Recipe

    Given I am signed in as admin/member
    Then I should see a link to My Recipe
    And I should click on the My Recipe link
    And I should see a list of uploaded recipes
    When I click on a recipe from the list
    Then I should see a recipe
    And I should find an option to delete the recipe
    When I click on the delete recipe link
    Then I should see my recipe deleted