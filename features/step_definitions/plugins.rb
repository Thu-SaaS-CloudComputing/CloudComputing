Given /^the following plugin exist:$/ do |plugins|
  plugins.hashes.each do |plugin|
    Plugins.create!(plugin)
  end
end

Then /^I should see plugin "(.+)" with status "(.+)"$/ do |plugin_name, plugin_status|
  tr = page.find_by_id(plugin_name)
  tr.find(:xpath,'//td[3]').should have_content(plugin_status)
end

Then /^I should (.+)see plugin "(.+)"$/ do |flag, plugin_name|
  if flag != nil
    page.should_not have_css(".#{plugin_name}")
  else
    page.should have_css(".#{plugin_name}")
  end
end

When /^I follow plugin "(.+)" status "(.+)"$/ do |plugin_name, status|
  puts plugin_name
  puts Plugins.all
  id = Plugins.find_by_name(plugin_name).id
  page.execute_script("Plugins.toggleEnable(#{id})")
end
