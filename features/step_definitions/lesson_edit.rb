Given /^the following lesson exist:$/ do |item_list|
  item_list.hashes.each do |item|
    Lesson.create!(item)
  end  
end
