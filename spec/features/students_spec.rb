describe "the students index page", type: :feature do
  before :each do
    # Helper method to login defined in spec_helper
    login
  end

  scenario "when user visits student page while logged in" do
    student = build(:student)
    student.save
    visit student_path(student)
    expect(page).to have_content('GPA')
    expect(page).to have_content("#{student.full_name}")
  end

  scenario "when user visits student page while not logged in" do
    click_link "Log out"
    student = build(:student)
    student.save
    visit '/students/1'
    expect(page).to have_content('Login')
  end
end


