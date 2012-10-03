FactoryGirl.define do

  factory :lifecycle_phase do
    sequence(:name) { Faker::Company.catch_phrase }
    sequence(:description) { Faker::Lorem.paragraph }
    sequence(:sequence) {|n| n}
    lifecycle
  end

end