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
  When I check "stats_server_load"
  And I uncheck the following stats: "stats_num_of_users, stats_bandwidth_demand, stats_num_of_caches, stats_storage_donated, stats_bandwidth_donated, stats_bandwidth_effectively_used"
  And I press "Update"
  Then the "stats_server_load" checkbox should be checked
  And the following checkboxes should not be checked: "stats_num_of_users, stats_bandwidth_demand, stats_num_of_caches, stats_storage_donated, stats_bandwidth_donated, stats_bandwidth_effectively_used"

Scenario: Selecting Number of Users, Number of Caches, Bandwidth Demand, and Bandwidth Donated
  When I check the following stats: "stats_num_of_users, stats_num_of_caches, stats_bandwidth_demand, stats_bandwidth_donated"
  And I uncheck the following stats: "stats_storage_donated, stats_bandwidth_effectively_used, stats_server_load"
  And I press "Update"
  Then the following checkboxes should be checked: "stats_num_of_users, stats_bandwidth_demand, stats_num_of_caches, stats_bandwidth_donated"
  And the following checkboxes should not be checked: "stats_storage_donated, stats_bandwidth_effectively_used, stats_server_load"

