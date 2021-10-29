@todomvc @edit
Feature: Edit todo

  Background:
    Given user is on ToDo page

  @T4
  Scenario: Edit active todo item
    Given user has 1 active item in the list
    When user double clicks on the item
    And user enters new label
    And user presses enter
    Then item should be updated in the list

  @T12
  Scenario: Edit completed todo item
    Given user has 1 completed item in the list
    When user double clicks on the item
    And user enters new label
    And user presses enter
    Then item should be updated in the list

  @T16
  Scenario: Clearing item text in edit mode removes the item
    Given user has 1 active item in the list
    When user double clicks on the item
    And clear item text
    And user presses enter
    Then item disappears from the list

  @T25
  Scenario: Clicking outside edit input saves the item
    Given user has 1 active item in the list
    When user double clicks on the item
    And user enters new label
    And user clicks on header title
    Then item should be updated in the list

  @T27
  Scenario: Pressing escape key dismisses item editing
    Given user has 1 active item in the list
    When user double clicks on the item
    And user enters new label
    And user presses escape
    Then item should not be updated in the list

#  @T28
#  Scenario: Check clicking outside edit box dismisses item editing

#  @T33
#  Scenario: Complete and delete icons disappear in edit mode
