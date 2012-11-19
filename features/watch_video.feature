Feature: watch a video from a course
  As a user
  In order to learn more about life and the universe
  I want to watch videos for available courses

Background: courses have been added to the database
  
  Given the following courses exist:
  |subject          |title   |
  |Computer Science |CS10    |
  |Computer Science |CS169   |
  |Biology          |BIO1A   |

  Given the following videos exist:([^"].*)$
  |name        | time    | size | source                               | course_id |
  |TDD         | "30:40" | 5MB  | 'https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded' | 2         |
  |BDD         | "30:40" | 5MB  | 'https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded' | 2         |
  |Recursion   | "30:40" | 5MB  | 'https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded' | 1         |
  |Krebs Cycle | "30:40" | 5MB  | 'https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded' | 3         |
  |Cells       | "30:40" | 5MB  | 'https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded' | 3         |

  Given the following users exist:
  |name                 |password |
  |x                    |x        |

  And I am on the homepage

Scenario: watch a video from a course
  When I am on the videos page for "CS169"
  Then I should see "TDD"
  And I should see "BDD"
  And I should see "30:40"
  And I should see "5MB"
  When I follow "TDD"
  Then I should see "Watch TDD"
  Then I should see "https://www.youtube.com/embed/Fr-B4xHZRzY?feature=player_embedded" inside iframe
