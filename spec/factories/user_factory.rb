FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    username "User_name"
    password "Password"
    authentication_token ENV['USER_REGISTRATION_TOKEN']
  end

  factory :admin, class: User do
    username "admin"
    password "password"
    first_name "John"
    last_name "Doe"
    authentication_token ENV['USER_REGISTRATION_TOKEN']
  end
end
