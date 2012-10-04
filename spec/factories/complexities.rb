# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complexity do
    sequence(:name) {|n| "Medium#{n}"}
  end
end
