describe "the students index page", type: :feature do
  before :each do
    # Helper method to login defined in spec_helper
    login
  end

  scenario "when user visits students index page while logged in" do
    visit students_path
    expect(page).to have_content('Name')
    expect(page).to have_content('Grade')
    expect(page).to have_content('GPA')
    expect(page).to have_content('Detentions')
    expect(page).to have_content('Gender')
    expect(page).to have_content('Current Teacher')
  end

  scenario "when user visits student page while logged in" do
    student = build(:student)
    student.save
    visit student_path(student)
    expect(page).to have_content("#{student.gpa}")
    expect(page).to have_content("#{student.full_name}")
    expect(page).to have_content("#{student.detentions}")
    expect(page).to have_content("#{student.gender}")
    expect(page).to have_content("#{student.teacher.full_name}")
    expect(page).to have_content("#{student.snack_food}")
    expect(page).to have_content("#{student.shirt_size}")
  end

  scenario "when user visits student page while not logged in" do
    click_link "Log out"
    student = build(:student)
    student.save
    visit '/students/1'
    expect(page).to have_content('Login')
  end

  scenario "when visiting a student's page I should be able to change their grade" do
    student = build(:student)
    student.save
    orig_grade = student.grade
    visit student_path(student)
    button = page.first(:css, 'input.grade.btn-increase' )
    button.click
    expect(page.find_by_id('grade').text).to eq "Grade: #{orig_grade + 1}"
    button = page.first(:css, 'input.grade.btn-decrease' )
    button.click
    expect(page.find_by_id('grade').text).to eq "Grade: #{orig_grade}"
  end

  scenario "when visiting a student's page I should be able to change their gpa" do
    student = build(:student)
    student.save
    orig_gpa = student.gpa
    visit student_path(student)
    button = page.first(:css, 'input.gpa.btn-increase' )
    button.click
    expect(page.find_by_id('gpa').text).to eq "GPA: #{orig_gpa + 0.1}"
    button = page.first(:css, 'input.gpa.btn-decrease' )
    button.click
    expect(page.find_by_id('gpa').text).to eq "GPA: #{orig_gpa}"
  end

  scenario "when visiting a student's page I should be able to change their detention" do
    student = build(:student)
    student.save
    orig_detentions = student.detentions
    visit student_path(student)
    button = page.first(:css, 'input.detentions.btn-increase' )
    button.click
    expect(page.find_by_id('detentions').text).to eq "Detentions: #{orig_detentions + 1}"
    button = page.first(:css, 'input.detentions.btn-decrease' )
    button.click
    expect(page.find_by_id('detentions').text).to eq "Detentions: #{orig_detentions}"
  end

  scenario "when visiting a student's page I can become their teacher" do
    student = build(:student)
    student.save
    user = User.find_by(username: 'admin')
    visit student_path(student)
    click_button 'Add Student to Your Group'
    expect(page.find_by_id('teacher').text).to eq "Teacher: #{user.full_name}"
  end
end


