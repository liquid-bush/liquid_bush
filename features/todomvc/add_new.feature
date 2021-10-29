@todomvc @add_new
Feature: Add new todo

  Background:
    Given user is on ToDo page

  @T1
  Scenario: Add new todo item
    When user enters "urgent thing" text into new todo input
    And user presses enter
    Then new item appears in the list

  @T18
  Scenario: Add new todo item
    When user enters "very looooooooooooooooooooooooooooong urgent thing" text into new todo input
    And user presses enter
    Then new item appears in the list

  @T19
  Scenario: Trailing spaces are trimmed in new todo item
    When user enters "  not so urgent thing  " text into new todo input
    And user presses enter
    Then new item appears in the list as "not so urgent thing"

  @T20
  Scenario: Cannot add blank todo item
    When user enters " " text into new todo input
    And user presses enter
    Then no items appear in the list

  @T21
  Scenario: Check item is added in the end of the list
    Given user has 2 active items in the list
    When user adds new item to the list
    Then new item appears in the end of the list

  @T22
  Scenario: Check identical item can be added twice
    Given user has 1 active item in the list
    When user adds the same item in the second time
    Then both items appear in the list

  @T23
  Scenario: New todo input placeholder is correct
    Then "What needs to be done?" placeholder is shown in the new todo input
