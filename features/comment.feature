Feature: As a troll
  in order to express my incredibly valuable opinions
  I would like to be able to comment on articles

Background: Here's some fake data in a factory
  Given the following articles exist
  | title                | content                            |
  | A breaking news item | Some really breaking action        |
  | Learn Rails 5        | Build awesome rails applications   |

Scenario: Making a comment
  Given I am on the "Learn Rails 5" page
  Then I should see the "Comment" link
  When I fill in the textbox with "Here's a horrible internet comment."
  And click the "Comment" link
  Then I should be on the "Learn Rails 5" page
  And I should see "Here's a horrible internet comment."
