Feature: As a troll
  in order to express my incredibly valuable opinions
  I would like to be able to comment on articles

Background: Here's some fake data in a factory
  Given the following articles exist
  | title                | content                            |
  | A breaking news item | Some really breaking action        |
  | Learn Rails 5        | Build awesome rails applications   |

Scenario: Making a comment, no email
  Given I am on the "Learn Rails 5" page
  Then I should see the "Comment" button
  When I fill in the textbox with "Here's a horrible internet comment."
  And click the "Comment" button
  Then I should be on the "Learn Rails 5" page
  And I should see "Here's a horrible internet comment."

Scenario: Comment with my email address
  Given I am on the "Learn Rails 5" page
  When I fill in the textbox with "Another horrible internet troll"
  And I fill in "Email" with "amber@amber.com"
  And click the "Comment" button
  Then I should be on the "Learn Rails 5" page
  And I should see "amber@amber.com"

Scenario: Commenting with a junk email address
  Given I am on the "Learn Rails 5" page
  When I fill in the textbox with "Super comment of love and peace"
  And I fill in "Email" with "amberamber.com"
  And click the "Comment" button
  Then I should see "You probably entered a crap email"
  And I should see "Super comment"
  And I should not see "amberamber.com says:"
