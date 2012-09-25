FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "#{Faker::Name.first_name}#{n}@gmail.com" }
    password "foobar"
    password_confirmation "foobar"
  end

  #This is an example of how you might create an object with random faker data
  #factory :post do
  #  sequence(:title) { Faker::Company.catch_phrase }
  #  sequence(:content) { Faker::Lorem.paragraph(10) }
  #  user
  #end

end