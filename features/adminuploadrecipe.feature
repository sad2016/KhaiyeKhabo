Feature: MemberUploadRecipe

  An member wants to upload a new recipe

  Scenario: Upload Recipe

    Given I am an admin
    And I am signed in
    Then I should see a link to Upload Recipe
    When I click on the Upload Recipe link
    Then I should see an Upload Recipe form
    When I submit the Upload Recipe form
    Then I should see the recipe I uploaded