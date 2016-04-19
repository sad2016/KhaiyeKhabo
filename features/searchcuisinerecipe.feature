Feature: SearchCuisineRecipe

  Someone wants to search cuisine recipes

  Scenario: Search Cuisine Recipe

    Given I am in home page
    And there are recipes uploaded by users
    Then I should see a link to View Recipe
    And I should click on the View Recipe link
    And I should see a list of uploaded recipes
    And I should see a link for a cuisine
    When I click on a cuisine
    Then I should see a list of uploaded recipes
    And I should type in the search for cuisine
    And I should see a list of recipes with that name
    When I click on a recipe from the list
    Then I should see a recipe