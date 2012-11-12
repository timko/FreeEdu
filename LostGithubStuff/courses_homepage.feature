Feature: Host an online platform

As a student
So that I can supplement my learning
I want to take a course with an online platform

Background: courses have been added to the database
  
  Given the following courses exist:
  |title                |course_num   |
  |Software Engineering |CS169        |
  |Getting FB Job       |CS999        |
  |Hackathon Crap       |CS998        |
  |Feel Sorry for Urself|PE101        |

  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  And I am on the homepage

Scenario: being able to see the courses on the website

  Then I should see "Software Engineering"
  And I should see "Getting FB Job"
  And I should see "Hackathon Crap"
  And I should see "Feel Sorry for Urself"

Scenario: clicking a course title
  
  When I follow "Software Engineering"
  Then I should be on the videos page for "Software Engineering"
