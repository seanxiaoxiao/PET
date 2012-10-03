# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deliverable do
    name "Architecture Document"
    description "Architecture Document"
    deliverable_type
    complexity
  end
end
