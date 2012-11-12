Feature: Create an account

As a New User
So that I gain access to the website's additional features
I want to create a new account

Background: you are on the homepage

  Given I am on the homepage

Scenario: Creating an account
  
  When I press "Signup"
  And I fill in "user_name" with "User1"
  And I fill in "password" with "x"
  And I press "Create"
  Then I should see "Your account has been successfully created"
  And I should be on the homepage
