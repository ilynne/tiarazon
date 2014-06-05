# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence(:email) { |n| "test#{n}@email.com" }

  factory :user do
  email { FactoryGirl.generate(:email) }
  password 'secretsecret'
  password_confirmation 'secretsecret'
  end

end
