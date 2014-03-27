FactoryGirl.define do
  factory :tag do
    name "New Tag"
  end

  factory :articles_tags do
    article_id
    tag_id
  end
end
