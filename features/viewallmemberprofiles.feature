Feature: Viewallmemberprofiles
  An admin wants to see all the member profiles

  Scenario: View all member profiles as admin

    Given I am an admin
    And I am signed in
    And there are members
    Then I should see a link for Member Profiles
    When I click on the Member Profiles link
    Then I should see the list of members