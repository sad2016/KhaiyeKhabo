Feature: AdminUpdateRecipe

  An admin wants to update and view recipe

  Scenario: Update Recipe

    Given I am an admin
    And I am signed in
    Then I should see a link to Upload Recipe
    When I click on the Upload Recipe link
    Then I should see an Upload Recipe form
    When I submit the Upload Recipe form
    Then I should see the recipe I uploaded
    Then I should see a link for My Recipes
    When I click on the My Recipes link
    Then I should see a list of my Uploaded recipes
    When I click on a recipe from the list
    Then I should see my recipe
    And I should see a link for Edit Recipe
    When I click on the Edit Recipe link
    Then I should see an Edit Recipe form
    When I submit the Edit Recipe form
    Then I should see my updated recipe
