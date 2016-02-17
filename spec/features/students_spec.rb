# describe "the students index page", type: :feature do
#   before :each do
#     user = build(:user)
#     user.username = 'admin'
#     user.password = 'password'
#     user.first_name = "John"
#     user.last_name = "Doe"
#     user.save
#     visit '/'
#     within("#login-form") do
#       fill_in 'username', with: "admin"
#       fill_in 'password', with: "password"
#     end
#     click_button 'Login'
#   end

#   scenario "when user visits student page while logged in" do
#     student = build(:student)
#     student.save
#     visit "/students/#{student.id}"
#     expect(page).to have_content('GPA')
#     expect(page).to have_content("#{student.full_name}")
#   end

#   scenario "when user visits student page while not logged in" do
#     click_link "Log out"
#     student = build(:student)
#     student.save
#     visit '/students/1'
#     expect(page).to have_content('Login')
#   end
# end