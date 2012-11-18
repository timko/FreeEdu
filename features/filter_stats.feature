Feature: Filter Statistics on the Graph
  As a user
  So that I can focus on only the graph statistics that I care about
  I want to select the graph statistics that I want to see

Background: Starting from the homepage
  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  Given the database is updated
  And I am on the homepage

Scenario: Selecting only the server load
  When I check "server_load"
  And I uncheck the following stats: "# of Users, Bandwidth Demand, # of Caches, Storage Donated, Bandwidth Donated, Bandwidth Effectively Used"
  And I press "apply_filter"
  Then I should see "Server Load"
  And I should not see the following stats:  "# of Users, Bandwidth Demand, # of Caches, Storage Donated, Bandwidth Donated, Bandwidth Effectively Used"

Scenario: View the total cache statistics
  When I am on the total cache statistics page
  Then I should see "Total Statistics"
  And I should see "Log Time" 
  
Scenario: Directing to the homepage
  When I am on the total cache statistics page
  And I follow "FreeEdu"
  Then I should be on the homepage
  
