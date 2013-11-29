Given /^the following users exist:$/ do |item_list|
  item_list.hashes.each do |item|
    User.create!(item)
  end  
end

Given /^the following priviledges exist:$/ do |item_list|
  item_list.hashes.each do |item|
    Priviledge.create!(item)
  end  
end

Given /^the following priviledges_users exist:$/ do |item_list|
  item_list.hashes.each do |item|
    priviledge = Priviledge.find_by_id(item[:priviledge_id])
    user = User.find_by_id(item[:user_id])
    priviledge.users << user
    user.priviledges << priviledge
    priviledge.save!
    user.save!
  end
end

Then /^I should see names and studentIDs of the following users: (.*)$/ do |lst|
  if lst.class == String
    art_list = lst.split(/[, "]+/)
    art_list.each do |user|
      id = User.find_by_name(user).id
      if page.respond_to? :should
        page.should have_content(user)
      else
        assert page.has_content?(user)
      end
      if page.respond_to? :should
        page.should have_content(id)
      else
        assert page.has_content?(id)
      end
    end
  end
end

When /^I follow detail of (.*)$/ do |user|
  page.find_by_id(user+"_detail").click
end
