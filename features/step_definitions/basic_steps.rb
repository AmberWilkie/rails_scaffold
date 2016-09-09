When(/^I am on the landing page$/) do
  visit root_path
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link(link)
end

Given(/^I am on the "([^"]*)" page$/) do |page|
  article = Article.find_by(title: page)
  visit article_path(article[:id])
end

Then(/^I should see the "([^"]*)" link$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^click the "([^"]*)" link$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be on the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
