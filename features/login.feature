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
  
  When I follow "Login"
  And I fill in "user_name" with "User1"
  And I fill in "user_password" with "x"
  And I press "Sign in"
  And I should be on the courses page
  And I should see "User1"

Scenario: Using a non existing username

  When I follow "Login"
  And I fill in "user_name" with "Fake"
  And I fill in "user_password" with "fake"
  And I press "Sign in" 
  And I should be on the login page
