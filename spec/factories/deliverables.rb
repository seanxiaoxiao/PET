# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deliverable do
    name "Architecture Document"
    description "Architecture Document"
    deliverable_type_id 1
    complexity_id 1
  end
end
