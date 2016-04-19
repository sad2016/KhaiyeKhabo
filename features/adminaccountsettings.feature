Feature: AdminAccountSettings

  An admin wants to edit his/her account settings and view the updated profile

  Scenario: Edit Account Settings

    Given I am an admin
    And I am signed in
    Then I should see a link for Edit Account Settings
    When I click on the Edit Account Settings link
    Then I should see an Edit Accont Settings form
    When I submit the Edit Account Settings form
    Then I should see my account settings updated