Given /^the following category exist:$/ do |item_list|
  item_list.hashes.each do |item|
    Category.create!(item)
  end  
end

Given /^the following article exist:$/ do |item_list|
  item_list.hashes.each do |item|
    Article.create!(item)
  end
end

Then /^(?:|I )am on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end


When /^I follow "(.*)"$/ do |click|
  click_link(click)
end 

Then /^I should see the following displayed: (.*)$/ do |lst|
  art_list = lst.scan(/[^, "]/)
  art_list.each do |art|
    if page.respond_to? :should
        page.should has_content(art)
    else
      assert page.has_content(art)
    end
  end
end
