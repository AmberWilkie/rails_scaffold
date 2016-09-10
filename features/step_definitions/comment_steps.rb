When(/^I fill in the textbox with "([^"]*)"$/) do |text|
  fill_in 'comment_body', with: text
end
