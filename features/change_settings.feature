Feature: Change your Settings

As a User
So that I can help the website save money
I want to contribute part of my disk space

Background: users have been added to the database

  Given the following users exist:
  |name                 |password |
  |User1                |x        |

  And I am on the homepage

Scenario: Successfully changing Settings

  Given I am logged in as "User1"
  Then show me the page
  When I press "Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "disk_space" with "512"
  And I fill in "bandwidth" with "128"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  And the "disk_space" field should contain "512"
  And the "bandwidth" field should contain "128" 

Scenario: Inputting invalid characters into disk space field

  Given I am logged in as "User1"
  Then show me the page
  When I press "Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "disk_space" with "-1"
  And I fill in "bandwidth" with "128"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  And the "disk_space" field should contain "0"
  And the "bandwidth" field should contain "128"
  
Scenario: Inputting invalid characters into bandwidth field

  Given I am logged in as "User1"
  Then show me the page
  When I press "Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "disk_space" with "512"
  And I fill in "bandwidth" with "asd"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  And the "disk_space" field should contain "512"
  And the "bandwidth" field should contain "0" 
  
Scenario: Try changing Settings without being logged in

  Given I am not logged in as a user

  Then I should not see "Settings"
  
Scenario: Successfully changing password

  Given I am logged in as "User1"
  When I press "Settings"

  When I fill in "old_password" with "x"
  And I fill in "new_password" with "y"
  And I fill in "password_confirmation" with "y"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  
Scenario: Wrong old password

  Given I am logged in as "User1"
  When I press "Settings"

  When I fill in "old_password" with "z"
  And I fill in "new_password" with "y"
  And I fill in "password_confirmation" with "y"
  And I press "Save Settings"
  Then I should see "Incorrect password"
  
Scenario: New password does not match the confirmation

  Given I am logged in as "User1"
  When I press "Settings"

  When I fill in "old_password" with "x"
  And I fill in "new_password" with "y"
  And I fill in "password_confirmation" with "z"
  And I press "Save Settings"
  Then I should see "Your new password must match the confirmation"
  And I should be on the settings page
