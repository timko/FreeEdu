Feature: watch a video from a course
  As a user
  In order to learn more about life and the universe
  I want to watch videos for available courses

Background: courses have been added to the database
  
  Given the following courses exist:
  |title                |course_num   |
  |Software Engineering |CS169        |
  |Getting FB Job       |CS999        |
  |Hackathon Crap       |CS998        |
  |Feel Sorry for Urself|PE101        |

  Given the following videos exist:
  |name                 | time    | size | source     |
  |TDD                  | "30:40" | 5MB  | "blah.com" |
  |BDD                  | "30:40" | 5MB  | "blah.com" |
  |Interviewing         | "30:40" | 5MB  | "blah.com" |
  |Tips and Tricks      | "30:40" | 5MB  | "blah.com" |
  |GO OUT AND SOCIALIZE | "30:40" | 5MB  | "blah.com" |

  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  And I am on the homepage

Scenario: watch a video from a course
  When I am on the videos page for "Software Engineering"
  Then I should see "TDD"
  And I should see "BDD"
  And I should see "30:40"
  And I should see "5MB"
  When I follow "TDD"
  Then I should see "Watch TDD"
