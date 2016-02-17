describe "the users index page", type: :feature do


  context "visits users index page" do
    before :each do
      logged_in_user = login
    end
    scenario "when user visits teacher index page" do
      visit users_path
      expect(page).to have_content("Teachers List")
      expect(page).to have_selector('img', count: User.count)
    end

    scenario "when user clicks a link it should
       go to specific teacher page" do
       visit users_path
       name = page.find(:css, '.thumbnail p').text
       page.find(:css, '.thumbnail').click
       expect(page).to have_content(name)
       expect(page.current_path).to eq user_path(User.first)
     end

  end

  context "user visits teacher show page" do
     before :each do
      logged_in_user = login
    end
    scenario "visit teacher show page" do
      visit user_path(User.first)
      expect(page).to have_content(User.first.full_name)
      expect(page).to have_content("Name")
      expect(page).to have_content("Grade")
      expect(page).to have_content("GPA")
      expect(page).to have_content("Detentions")
      expect(page).to have_content("Gender")
    end
  end

  context "user visits registration page" do
    it "shows registration page" do
      visit new_user_path
      expect(page).to have_content("Join the KISS Army")
      expect(page).to have_content("Register")
    end
    it "allows a new user to register with correct code" do
      visit new_user_path
      within("#new_user") do
        fill_in 'user_username', with: "administrator"
        fill_in 'user_first_name', with: "administrator"
        fill_in 'user_last_name', with: "administrator"
        fill_in 'user_password', with: "administrator"
        fill_in 'user_password_confirmation', with: "administrator"
        fill_in 'user_authentication_token', with: ENV['USER_REGISTRATION_TOKEN']
      end
      click_button "Register"
      expect(page.current_path).to eq user_path(User.last)
    end
    it "does not allows a new user to register without correct code" do
      visit new_user_path
      within("#new_user") do
        fill_in 'user_username', with: "admin"
        fill_in 'user_first_name', with: "admin"
        fill_in 'user_last_name', with: "admin"
        fill_in 'user_password', with: "admin"
        fill_in 'user_password_confirmation', with: "admin"
        fill_in 'user_authentication_token', with: "12345"
      end
      click_button "Register"
      expect(page.current_path).to eq users_path
    end
  end

end
