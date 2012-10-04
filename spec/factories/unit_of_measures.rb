# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit_of_measure do
    sequence(:name) {|n| "Pages#{n}"}
  end
end
