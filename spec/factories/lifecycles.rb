# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lifecycle do
    sequence(:name) {|n| "Waterfall#{n}"}
    sequence(:description) { Faker::Lorem.paragraph }
  end
end
