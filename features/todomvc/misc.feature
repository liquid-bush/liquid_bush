@todomvc @misc
Feature: Misc

  Background:
    Given user is on ToDo page

  @T17
  Scenario: Item persists when user reloads page
    Given user has 1 active item in the list
    When user reloads page
    Then item is present in the list

#  @T25
#  Scenario: Check footer is present when list contains at least one item

#  @T26
#  Scenario: Check footer is missing when list doesn't contain any items

#  @T30
#  Scenario: Check information in the bottom

#  @T31
#  Scenario: Footer is present only if there is at least one item in the list
