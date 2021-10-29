@todomvc @counter
Feature: Active items counter

  Background:
    Given user is on ToDo page

  @T9
  Scenario: Check active items counter when there is one active item in the list
    Given user has 1 active item in the list
    Then active items counter shows "1 item left"

  @T10
  Scenario: Check active items counter when there are multiple active items in the list
    Given user has 2 active items in the list
    Then active items counter shows "2 items left"

  @T11
  Scenario: Check active items counter when there are no active items in the list
    Given user has 2 completed items in the list
    Then active items counter shows "0 items left"
