Feature: watch a video from a course
  As a user
  In order to learn more about life and the universe
  I want to watch videos for available courses

Background: courses have been added to the database
  
  Given the following courses exist:
  |title                |course_num   |university    |
  |Software Engineering |CS169        |UC Berkeley   |
  |Getting FB Job       |CS999        |UC Berkeley   |
  |Hackathon Crap       |CS998        |UC Los Angeles|
  |Feel Sorry for Urself|PE101        |Stanford      |

  Given the following videos exist:
  |name                 | course_id | time    | size |
  |TDD                  | 1         | "30:40" | 5MB  |
  |BDD                  | 1         | "30:40" | 5MB  |
  |Interviewing         | 2         | "30:40" | 5MB  |
  |Tips and Tricks      | 3         | "30:40" | 5MB  |
  |GO OUT AND SOCIALIZE | 4         | "30:40" | 5MB  |

  And I am on the FreeEdu homepage

Scenario: watch a video from a course
  When I am on the videos page for "Software Engineering"
  Then I should see "TDD"
  And I should see "BDD"
  And I should see "30:40"
  And I should see "5MB"
  When I follow "TDD"
  Then I should see "Watch TDD"
