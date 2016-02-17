FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    username "User_name"
    password "Password"
    authentication_token ENV['USER_REGISTRATION_TOKEN']
  end
end
