# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  end
  factory :admin do
    email "abc@abc.com"
    admin true
    password "foobar"
    password_confirmation {|u| u.password}
  end
end
