@todomvc @filters
Feature: Filtering todos

  Background:
    Given user is on ToDo page

  @T13
  Scenario: Check only active items appear in "Active" list
    Given user has 2 active items in the list
    When user completes an item
    And user selects "Active" filter
    Then active item is present in the list
    And completed item disappears from the list

  @T14
  Scenario: Check only completed items appear in "Completed" list
    Given user has 2 active items in the list
    When user completes an item
    And user selects "Completed" filter
    Then completed item is present in the list
    And active item disappears from the list

  @T34
  Scenario: Check both active and completed items appear in "All" list
    Given user has 1 active item in the list
    And user has 1 completed item in the list
    Then active item is present in the list
    And completed item is present in the list
