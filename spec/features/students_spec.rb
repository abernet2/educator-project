require 'rails_helper'

feature "User visiting student page" do
  before :each do
    user = build(:user)
    user.username = 'admin'
    user.password = 'password'
    user.save
  end
  scenario "when user visits student page while logged in" do
    visit '/'
    within("#login-form") do
      fill_in 'username', with: "admin"
      fill_in 'password', with: "password"
    end
    click_button 'Login'
    student = build(:student)
    student.teacher_id = user.id
    student.save
    visit '/students/1'
    expect(page).to have_content('GPA')
  end

  scenario "when user visits student page while not logged in" do
    student = build(:student)
    student.teacher_id = user.id
    student.save
    visit '/students/1'
    expect(page).to have_content('GPA')
  end
end