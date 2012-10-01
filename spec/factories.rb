# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :lifecycle do
    name "A lifecycle"
    description "A lifecycle description"
  end

  factory :lifecycle_phase do
    sequence(:name) { Faker::Company.catch_phrase }
    sequence(:description) { Faker::Lorem.paragraph }
    sequence(:sequence) {|n| n}
    lifecycle
  end

  factory :project do
    sequence(:name) { Faker::Company.catch_phrase }
    sequence(:description) { Faker::Lorem.paragraph }
    lifecycle
  end

  factory :project_phase do
    lifecycle_phase
    project
  end

end
