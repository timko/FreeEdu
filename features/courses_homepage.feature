Feature: Host an online platform

  As a student
  So that I can supplement my learning
  I want to take a course with an online platform

Background: courses have been added to the database
  
  Given the following courses exist:
  |subject          |title   |
  |Computer Science |CS10    |
  |Computer Science |CS169   |
  |Biology          |BIO1A   |

  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  And I am on the homepage

Scenario: being able to see the courses on the website

  Then I should see "CS10"
  And I should see "CS169"
  And I should see "BIO1A"
  And I should see "Computer Science"
  And I should see "Biology"

Scenario: clicking a course title
  
  When I follow "CS169"
  Then I should be on the videos page for "CS169"
