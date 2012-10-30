Feature: View total cache statistics
  As a user
  So I can see the total amount of money saved by this website
  I want to view the total cache statistics for the site

Background: Starting from the homepage
  And I am on the FreeEdu homepage

Scenario: Getting to the total cache statistics page
  When I follow "Total Cache Statistics"
  Then I should be on the total cache statistics page

Scenario: View the total cache statistics
  When I am on the total cache statistics page
  Then I should see "Total Statistics"
  Then I should see "total_cache_statistics_visualizer"
  
Scenario: Directing to the settings page
  When I am on the total cache statistics page
  And I follow "Cache Settings"
  Then I should be on the settings page
  
Scenario: Directing to the homepage
  When I am on the total cache statistics page
  And I click the FreeEdu image
  Then I should be on the FreeEdu homepage
  
