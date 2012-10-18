Feature: watch a video from a course
  As a user
  In order to learn more about life and the universe
  I want to watch videos for available courses

Background: The site is set up

Scenario: watch a video from a course
  Given I am on the videos page for "Computer Science"
  And I press "watch video" for "Lecture 1"
  Then I should be on the video page for "Lecture 1"
  
