Then /^(?:|I )should see "([^"]*)" in "([^"]*)"$/ do |article, category|
  assert Article.find_by_title(article).category == category
end
Then /^(?:|I )should not see "([^"]*)" in "([^"]*)"$/ do |article, category|
  assert Article.find_by_title(article).category != category
end


When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  #puts page.methods
  #puts page.body
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end
