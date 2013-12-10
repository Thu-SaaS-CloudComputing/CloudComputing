FactoryGirl.define do
  factory :plugins do
    description 'fake plugin'
    enable false
    id 1
    name 'fake_plugin'
    link '/'
  end
end
