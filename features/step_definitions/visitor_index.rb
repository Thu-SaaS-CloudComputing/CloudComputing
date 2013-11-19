Then /I should see the following displayed in the block of (.+): (.*)$/ do |category_name, contents|
  debugger
  block = page.find_by_id(category_name)
  if block==nil
    assert false
  else
    name_list = contents.split(/[, "]+/)
    name_list.each do |name|
      if page.respond_to? :should
        block.should have_content(name)
      else
        assert block.has_content?(name)
      end
    end
  end
end

Then /^I should see the following displayed in the navigator: (.*)$/ do |lst|
  navigator = page.find_by_id("navigator")
  if lst.class == String
    art_list = lst.split(/[, "]+/)
    art_list.each do |art|
      if page.respond_to? :should
        navigator.should have_content(art)
      else
        assert navigator.has_content?(art)
      end
    end
  end
end

Then /^I should not see the following displayed in the navigator: (.*)$/ do |lst|
  navigator = page.find_by_id("navigator")
  if lst.class == String
    art_list = lst.split(/[, "]+/)
    art_list.each do |art|
      if page.respond_to? :should
        navigator.should have_no_content(art)
      else
        assert navigator.has_no_content?(art)
      end
    end
  end
end
