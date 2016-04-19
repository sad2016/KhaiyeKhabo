Feature: SearchRecipe

  Someone wants to search recipes

  Scenario: Search Recipe

    Given I am in home page
    And there are recipes uploaded by users
    Then I should see an option to search for recipes
    And I should type in the search
    And I should see a list of recipes with that name
    When I click on a recipe from the list
    Then I should see a recipe