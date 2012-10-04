# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deliverable_type do
    sequence(:name) {|n| "Document#{n}"}
    unit_of_measure
  end
end
