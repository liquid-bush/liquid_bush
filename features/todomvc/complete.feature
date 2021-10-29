@todomvc @complete
Feature: Complete todo

  Background:
    Given user is on ToDo page

  @T2
  Scenario: Complete todo item
    Given user has 1 active item in the list
    When user clicks on item toggle
    Then item is marked as completed

  @T3
  Scenario: Uncomplete todo item
    Given user has 1 completed item in the list
    When user clicks on item toggle
    Then item is marked as active
