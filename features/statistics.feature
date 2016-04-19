Feature: Statistics

  An admin wants to check the statistics on member registration

  Scenario: Check Statistics

    Given I am an admin
    And I am signed in
    Then I should see a link for Statistics
    When I click on the Statistics link
    Then I should see different statistics on member registration