# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deliverable do
    name "PET Deliverable Document"
    sequence(:description) { Faker::Lorem.paragraph }
    project_phase
    deliverable_type
    complexity
  end
end
