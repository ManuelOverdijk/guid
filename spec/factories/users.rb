# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "john@example.com"
    password "secret"
    password_confirmation "secret"
    trait :no_agent do
      role "no_agent"
    end
    
    trait :agent do
      role "agent"
    end

    
  end
end
