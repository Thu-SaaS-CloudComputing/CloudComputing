FactoryGirl.define do
  factory :priviledge do
    name "Unknown"
    description "Empty"
  end

  factory :priviledges_users do
    user_id
    priviledge_id
  end
end
