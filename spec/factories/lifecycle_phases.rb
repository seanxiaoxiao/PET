# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lifecycle_phase do
    sequence(:name) {|n| "Requirements Phase#{n}"}
    sequence(:description) { Faker::Lorem.paragraph }
    sequence(:sequence) {|n| n}
    lifecycle
  end
end