require 'rails_helper'

feature "User visiting student page" do
  scenario "when user visits student page" do
    user = build(:user)
    user.save
    student = build(:student)
    student.teacher_id = user.id
    student.save
    visit '/students/1'
    expect(page).to have_content('GPA')
  end
end