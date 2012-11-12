Feature: View total cache statistics
  As a user
  So I can see the total amount of money saved by this website
  I want to view the total cache statistics for the site

Background: Starting from the homepage
  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  Given the database is updated
  And I am on the homepage

Scenario: Getting to the total cache statistics page
  When I follow "Total Cache Statistics"
  Then I should be on the total cache statistics page

Scenario: View the total cache statistics
  When I am on the total cache statistics page
  Then I should see "Total Statistics"
  And I should see "Log Time" 
  
Scenario: Directing to the homepage
  When I am on the total cache statistics page
  And I follow "FreeEdu"
  Then I should be on the homepage
  
