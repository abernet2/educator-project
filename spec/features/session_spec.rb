describe "the login page", :type => :feature do
  before :each do
    user = build(:user)
    user.username = 'admin'
    user.password = 'password'
    user.save
  end

  it "signs me in" do
    visit '/'
    within("#login-form") do
      fill_in 'username', with: "admin"
      fill_in 'password', with: "password"
    end
    click_button 'Login'
    expect(page).to have_content 'Log out'
  end

  it "has a link to the registration page" do
    visit '/'
    click_link 'Need to register?'
    expect(page).to have_content 'Join the KISS Army
'
  end

end
