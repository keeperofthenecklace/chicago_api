@F_01 @EVENT_LIST
Feature: Event list, I want to be able to see a list of the events

  Scenario: List event
    Given the system knows about the following events:
      | id | title             | event_begins_at | event_ends_at | user_id | created_at | update_at  |
      | 1  | US PGA            | 2015-08-13      | 2015-08-16    | 1       | 2015-07-04 | 2015-07-05 |
      | 2  | US Open           | 2015-08-31      | 2015-09-13    | 2       | 2015-07-06 | 2015-07-07 |
    When the client requests GET /v1/events
    Then the response should be JSON:
      """
      [
        {
          "id": "1",
          "title": "US PGA",
          "event_begins_at": "2015-08-13",
          "event_ends_at": "2015-08-16",
          "user_id": "1",
          "created_at": "2015-07-04",
          "update_at": "2015-07-05"
          },
        {
          "id": "2",
          "title": "US Open",
          "event_begins_at": "2015-08-31",
          "event_ends_at": "2015-09-13",
          "user_id": "2",
          "created_at": "2015-07-06",
          "update_at": "2015-07-07"
        }
      ]
      """
