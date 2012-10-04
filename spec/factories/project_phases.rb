# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_phase do
    lifecycle_phase
    project
  end
end