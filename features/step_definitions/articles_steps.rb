Given(/^the following articles exist$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |hash|
    Article.create!(hash)
  end
end
