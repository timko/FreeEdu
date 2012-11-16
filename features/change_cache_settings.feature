Feature: Change your cache settings

As a User
So that I can help the website save money
I want to contribute part of my disk space

Background: users have been added to the database

  Given the following users exist:
  |name                 |password |
  |User1                |x        |

  And I am on the homepage

Scenario: Successfully changing cache settings

  Given I am logged in as "User1"

  When I press "Cache Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "disk_space" with "512"
  And I fill in "bandwidth" with "128"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  And the "disk_space" field should contain "512"
  And the "bandwidth" field should contain "128" 

Scenario: Try changing cache settings without being logged in

  Given I am not logged in as a user

  When I press "Cache Settings"
  Then I should see "You are not logged in"
  And I should be on the login page
