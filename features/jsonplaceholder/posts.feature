@jsonplaceholder
Feature: Posts

  @J1
  Scenario: Retrieve all posts
    When user requests all posts
    Then posts count is 100

  @J2
  Scenario: Retrieve filtered posts
    When user requests all posts created by the user with id 1
    Then posts count is 10
    And all returned posts are created by the user with id 1

  @J3
  Scenario: Retrieve single post
    When user requests post with id 1
    Then next post is returned:
      | id | title                                                                      |
      | 1  | sunt aut facere repellat provident occaecati excepturi optio reprehenderit |

  @J4
  Scenario: Create a post
    When user creates a new post:
      | title      |
      | post title |
    Then next post is returned:
      | id  | title      |
      | 101 | post title |

  @J5
  Scenario: Update a post
    When user updates a post:
      | title     |
      | new title |
    Then next post is returned:
      | title     |
      | new title |

  @J6
  Scenario: Delete a post
    Then user deletes a post

  @J7
  Scenario: Retrieve post comments
    When user requests all comments for the post with id 1
    Then comments count is 5
    And all returned comments are related to the post with id 1


