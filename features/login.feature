Feature: Login to existing account

As a User
So that I can customize my settings
I want to login to my existing account

Background: users have been added to the database

  Given the following users exist:
  |name                 |password |
  |User1                |x        |

  And I am on the homepage

Scenario: Logging in to existing account
  
  When I press "Login"
  And I fill in "user_name" with "User1"
  And I fill in "password" with "x"
  And I press "Login"
  Then I should see "You have successfully logged in"
  And I should be on the homepage

Scenario: Using a non existing username

  When I press "Login"
  And I fill in "user_name" with "Fake"
  And I fill in "password" with "fake"
  And I press "Login"
  Then I should see "Your username and/or password is incorrect"
  And I should be on the login page
