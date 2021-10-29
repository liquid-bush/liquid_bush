@todomvc @remove
Feature: Remove todo

  Background:
    Given user is on ToDo page

  @T5
  Scenario: Remove active todo item
    Given user has 1 active item in the list
    When user hovers over the item
    When user clicks on delete button
    Then item disappears from the list

  @T6
  Scenario: Remove completed todo item
    Given user has 1 completed item in the list
    When user hovers over the item
    And user clicks on delete button
    Then item disappears from the list
