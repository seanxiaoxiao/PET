# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:name) {|n| "PET#{n}"}
    sequence(:description) { Faker::Lorem.paragraph }
    lifecycle
  end
end