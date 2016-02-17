FactoryGirl.define do
  factory :student do
    association :teacher, factory: :user

    first_name "John"
    last_name "Doe"
    grade 1
    gpa 2.5
    detentions 3
    gender "M"
    snack_food "kale chips"
    shirt_size "L"
  end
end
