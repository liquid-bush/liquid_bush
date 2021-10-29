@todomvc @clear_completed
Feature: Clear completed option

  Background:
    Given user is on ToDo page

  @T15
  Scenario: "Clear completed" option removes completed items
    Given user has 1 active items in the list
    And user has 2 completed items in the list
    And user clicks on "Clear completed" button
    Then completed items disappear from the list

#  @T29
#  Scenario: "Clear completed" is present only if there are completed items
