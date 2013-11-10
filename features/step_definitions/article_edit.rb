Then /^(?:|I )should see "([^"]*)" in "([^"]*)"$/ do |article, category|
  assert Article.find_by_title(article).category == category
end
Then /^(?:|I )should not see "([^"]*)" in "([^"]*)"$/ do |article, category|
  assert Article.find_by_title(article).category != category
end

