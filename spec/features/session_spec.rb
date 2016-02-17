describe "the login page", :type => :feature do
  before :each do
    admin = build(:admin)
    admin.save
  end
  let(:admin) {User.find_by(username: 'admin')}

  it "signs me in" do
    login
    expect(page).to have_content 'Log out'
  end

  it "has a link to the registration page" do
    visit '/'
    click_link 'Need to register?'
    expect(page).to have_content 'Join the KISS Army'
  end


  it "While logged in, I can't see the login form" do
    login
    visit '/'
    expect(page.current_path).to eq user_path(admin)
  end

  it "While logged in, I can't see the register form" do
    login
    visit '/'
    expect(page.current_path).to eq user_path(admin)
  end


end
