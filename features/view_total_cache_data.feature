Feature: View total cache data
  As a user
  So I can see the total amount of money saved by this website
  I want to view the total cache statistics for the site

Background: Starting from the homepage
  And I am on the FreeEdu homepage

Scenario: View the total cache data
  When I am on the total cache data page
  Then I should see "Total Statistics"
  Then I should see "total_cache_data.png"
  
Scenario: Directing to the settings page
  When I am on the total cache data page
  And I follow "Go Back"
  Then I should be on the settings page
  
Scenario: Directing to the homepage
  When I am on the total cache data page
  And I click the FreeEdu image
  Then I should be on the homepage
  
