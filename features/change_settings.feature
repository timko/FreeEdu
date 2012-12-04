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

  Given I am logged in as "User1" with password "x"
  When I follow "Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "user_disk_space" with "512"
  And I fill in "user_bandwidth" with "128"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  And the "user_disk_space" field should contain "512"
  And the "user_bandwidth" field should contain "128" 

Scenario: Inputting invalid characters into disk space field

  Given I am logged in as "User1" with password "x"
  #Then show me the page
  When I follow "Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "user_disk_space" with "-1"
  And I fill in "user_bandwidth" with "128"
  And I press "Save Settings"
  Then I should see "Disk Space and Bandwidth must be positive integers"
  And the "user_disk_space" field should contain "0"
  And the "user_bandwidth" field should contain "0"
  
Scenario: Inputting invalid characters into bandwidth field

  Given I am logged in as "User1" with password "x"
  #Then show me the page
  When I follow "Settings"
  Then I should see "Disk Space"
  And I should see "Bandwidth"

  When I fill in "user_disk_space" with "512"
  And I fill in "user_bandwidth" with "asd"
  And I press "Save Settings"
  Then I should see "Disk Space and Bandwidth must be positive integers"
  And the "user_disk_space" field should contain "0"
  And the "user_bandwidth" field should contain "0"
  
Scenario: Try changing Settings without being logged in

  Given I am not logged in as a user

  Then I should not see "Settings"
  
Scenario: Successfully changing password

  Given I am logged in as "User1" with password "x"
  When I follow "Settings"

  When I fill in "old_password" with "x"
  And I fill in "user_password" with "y"
  And I fill in "user_password_confirmation" with "y"
  And I press "Save Settings"
  Then I should see "Settings successfully saved"
  
Scenario: Wrong old password

  Given I am logged in as "User1" with password "x"
  When I follow "Settings"

  When I fill in "old_password" with "z"
  And I fill in "user_password" with "y"
  And I fill in "user_password_confirmation" with "y"
  And I press "Save Settings"
  Then I should see "Old Password must match your current password"
  
Scenario: New password does not match the confirmation

  Given I am logged in as "User1" with password "x"
  When I follow "Settings"

  When I fill in "old_password" with "x"
  And I fill in "user_password" with "y"
  And I fill in "user_password_confirmation" with "z"
  And I press "Save Settings"
  Then I should see "New Password must match New Password Confirmation"
  And I should be on the settings page
