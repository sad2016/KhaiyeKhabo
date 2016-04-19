Feature: ViewMyRecipe

  I want to view my own recipes

  Scenario: View My Recipe

    Given I am signed in as admin/member
    Then I should see a link to My Recipe
    And I should click on the My Recipe link
    And I should see a list of uploaded recipes
    When I click on a recipe from the list
    Then I should see a recipe