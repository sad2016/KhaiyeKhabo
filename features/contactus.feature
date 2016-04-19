Feature: ContactUs

    Anyone should be able to give their comments and suggestions

  Scenario: Contact Us

    Given I visit the Home page
    Then  I should see a link for Contact Us
    When I click on the Contact Us link
    Then I should see a Contact Us form
    When I submit the Contact Us form
    Then I should see a confirmation that my message has been sent