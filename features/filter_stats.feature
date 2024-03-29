Feature: Filter Statistics on the Graph

  As a User
  So that I can focus on only the graph statistics that I care about
  I want to select the graph statistics that I want to see

Background: Starting from the homepage
  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  And the following courses exist:
  |title                |subject      |
  |Software Engineering |CS           |
  |Getting FB Job       |CS           |
  |Hackathon Crap       |CS           |
  |Feel Sorry for Urself|PE           |

  And the database is updated
  And I am on the homepage

Scenario: Selecting only the server load
  When I follow "Total Cache Statistics"
  And I check "stats_server_load"
  And I uncheck the following stats: "num_of_users, bandwidth_demand, num_of_caches, storage_donated, bandwidth_donated, bandwidth_effectively_used"
  And I press "Update"
  Then the "stats_server_load" checkbox should be checked
  And the following checkboxes should not be checked: "num_of_users, bandwidth_demand, num_of_caches, storage_donated, bandwidth_donated, bandwidth_effectively_used"

Scenario: Selecting Number of Users, Number of Caches, Bandwidth Demand, and Bandwidth Donated
  When I follow "Total Cache Statistics"
  And I check the following stats: "num_of_users, num_of_caches, bandwidth_demand, bandwidth_donated"
  And I uncheck the following stats: "storage_donated, bandwidth_effectively_used, server_load"
  And I press "Update"
  Then the following checkboxes should be checked: "num_of_users, bandwidth_demand, num_of_caches, bandwidth_donated"
  And the following checkboxes should not be checked: "storage_donated, bandwidth_effectively_used, server_load"

Scenario: Saving filtered settings when going to a different page
  When I follow "Total Cache Statistics"
  And I check the following stats: "num_of_users, num_of_caches, bandwidth_demand, bandwidth_donated"
  And I uncheck the following stats: "storage_donated, bandwidth_effectively_used, server_load"
  And I press "Update"
  And I follow "FreeEdu"
  And I follow "Total Cache Statistics"
  Then the following checkboxes should be checked: "num_of_users, bandwidth_demand, num_of_caches, bandwidth_donated"
  And the following checkboxes should not be checked: "storage_donated, bandwidth_effectively_used, server_load"