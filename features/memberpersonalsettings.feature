Feature: MemberPersonalSettings

  A member wants to edit his/her personal settings and view the updated profile

  Scenario: Edit personal settings

    Given I am a member
    And I am signed in
    Then I should see a link for Edit Personal Settings
    When I click on the Edit Personal Settings link
    Then I should see an Edit Personal Settings form
    When I submit the Edit Personal Settings form
    Then I should see my personal settings updated