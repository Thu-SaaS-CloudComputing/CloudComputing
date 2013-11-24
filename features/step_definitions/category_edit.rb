Then /^(?:|I )should see "([^"]*)" with "([^"]*)" being its parent$/ do |category, parent|
  assert "#{Category.find_by_name(category).parent}" == parent
end
When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end
Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
Then /^(?:|I )should not see "([^"]*)"$/ do |text|
    assert !page.has_content?(text)
end
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  assert page.body.index(e1) < page.body.index(e2)
end
