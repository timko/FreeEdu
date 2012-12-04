Feature: Create an account

As a New User
So that I gain access to the website's additional features
I want to create a new account

Background: you are on the homepage

  Given I am on the login page

Scenario: Creating an account
  
  When I follow "Sign up"
  And I fill in "user_name" with "User1"
  And I fill in "user_password" with "x"
	And I fill in "user_password_confirmation" with "x"
  And I press "Create"
  And I should be on the courses page

Scenario: Creating an account with mismatching passwords
  
  When I follow "Sign up"
  And I fill in "user_name" with "User1"
  And I fill in "user_password" with "x"
	And I fill in "user_password_confirmation" with "y"
  And I press "Create"
  Then I should be on the create_user_page
