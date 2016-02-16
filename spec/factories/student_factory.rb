FactoryGirl.define do
  factory :student do 
    first_name "John"
    last_name "Doe"
    grade 1
    gpa 2.5
    detentions 3
    gender "M"
    snack_food "kale chips"
    shirt_size "L"
    teacher_id 1
  end
end
