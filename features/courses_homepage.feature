Feature: Host an online platform

As a student
So that I can supplement my learning
I want to take a course with an online platform

Background: courses have been added to the database
  
  Given the following courses exist:
  |title                |course number|university    |
  |Software Engineering |CS169        |UC Berkeley   |
  |Getting FB Job       |CS999        |UC Berkeley   |
  |Hackathon Crap       |CS998        |UC Los Angeles|
  |Feel Sorry for Urself|PE101        |Stanford      |

  And I am on the FreEdu homepage

Scenario: being able to see the courses on the website

  Then I should see "Software Engineering"
  And I should see "Getting FB Job"
  And I should see "Hackathon Crap"
  And I should see "Feel Sorry for Urself"

Scenario: clicking cache settings

  When I press "Cache Settings"
  Then I should be on the settings page

Scenario: clicking a course title
  
  When I follow "Software Engineering"
  Then I should be on the videos page for "Software Engineering"
