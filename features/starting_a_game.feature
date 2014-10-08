 Feature: Starting a game
 	In order to play Rock Paper Scissors 
  	As a competitive  player
  	I want to start a new game

  	Scenario: Registering
  		Given I am on the homepage
  		When I enter a "Name"
  		Then I will see "You'll be playing against the Rock, Paper, Scissors computer."
