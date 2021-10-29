@todomvc @toggle_all
Feature: Toggle all button

  Background:
    Given user is on ToDo page

  @T7
  Scenario: Complete all todo items
    Given user has 2 active items in the list
    When user clicks on toggle all button
    Then all items become completed

  @T8
  Scenario: Uncomplete all todo items
    Given user has 2 completed items in the list
    When user clicks on toggle all button
    Then all items become active

  @T24
  Scenario: Toggle all button is not displayed if there are no items in the list
    Then toggle all button is hidden

#  @T32
#  Scenario: Toggle all button has different color when all items are completed
