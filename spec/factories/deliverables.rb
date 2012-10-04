# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deliverable do
    sequence(:name) {|n| "PET Deliverable Document#{n}"}
    sequence(:description) { Faker::Lorem.paragraph }
    project_phase
    deliverable_type
    complexity
  end
end
