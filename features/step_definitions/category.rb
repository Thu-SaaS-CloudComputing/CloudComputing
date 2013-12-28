def path_to(page_name)
  case page_name

  when /an article (.+) page/
    article_path(Article.find_by_title($1).id)
  when /a category (.+) page/
    category_path(Category.find_by_name($1).id)
  when /the new article page/
    new_article_path()
  when /the edit page of "(.+)"$/
    edit_article_path()
  when /the visitor index page/
    "/visitor_index/0"
  when /the admin page/
    admin_index_path()
  when /the edit categary page/
    "/admin/category/0"
  when /the edit lesson table page/
    "/admin/lesson_table/0"
  when /the user management page/
    "/admin/user"
  when /(.+) detail page/
    "/admin/user/#{User.find_by_name($1).id}"
  #when /"(.+)" edit page/
  #  "/admin/category/#{Category.find_by_name($1).id}/edit"
  end
  
end

Given /I have already logged in with (.+)$/ do |account|
  visit "/admin/login"
  fill_in :login_username, :with => account
  fill_in :login_password, :with => "admin"
  click_button "login_btn"
end

Given /^the following category exist:$/ do |item_list|
  item_list.hashes.each do |item|
    Category.create!(item)
  end  
end

Given /^the following article exist:$/ do |item_list|
  item_list.hashes.each do |item|
    item[:category] = Category.find_by_name(item[:category])
    Article.create!(item)
  end
end

When /I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end


When /^I follow "(.*)"$/ do |link_name|
  #debugger
  first(:link, link_name).click
  #click_link(link_name)
end 

Then /^I should see the following displayed: (.*)$/ do |lst|
  if lst.class == String
    art_list = lst.split(/[, "]+/)
    art_list.each do |item|
      if page.respond_to? :should
        page.should have_content(item)
      else
        assert page.has_content?(item)
      end
    end
  end
end

Then /^I should not see the following displayed: (.*)$/ do |lst|
  if lst.class == String
    art_list = lst.split(/[, "]+/)
    art_list.each do |item|
      if page.respond_to? :should
        page.should have_no_content(item)
      else
        assert page.has_no_content?(item)
      end
    end
  end
end

