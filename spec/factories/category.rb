FactoryGirl.define do
  factory :article do
    title "fake_article"
    author "unknown"
  end

  factory :category do
    name "test_category"
    parent 0
    articles {[FactoryGirl.build(:article)]}
    order 0
  end
end
