@api
Feature: List events
  As an API Client
  In orders to utilize my events
  I want to get a list of events

  Scenario: get all events as JSON
    Given I am a valid API user
    And I send and accept JSON
    And I have 1 event records
    When I send a GET request for "/v1/events/"
    Then The response should be "200"
    And The JSON response should be an array with 1 "event" element
