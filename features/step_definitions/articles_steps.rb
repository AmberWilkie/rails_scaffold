Given(/^the following articles exist$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:article, hash)
  end
end

Given(/^someone deletes the "([^"]*)" article while I'm viewing it$/) do |title|
  Article.destroy(Article.find_by(title: title))
  expect(Article.find_by(title: title)).to be nil
end
