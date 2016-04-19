Feature: Banorunbanmember
  An admin wants to edit his/her account settings and view the updated profile

  Scenario: Ban or Unban a member being an admin

    Given I am an admin
    And I am signed in
    And there are members
    Then I should see a link for Member Profiles
    When I click on the Member Profiles link
    Then I should see the list of members
    And I should see a link to ban or unban a member
    When I click on ban or unban link
    Then I should see the updated status of that member