describe User do
  it {should have_many :students}
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :last_name}
  it {should validate_presence_of :username}
  it {should validate_presence_of :password_digest}
  it {should validate_confirmation_of :password}

  # shoulda matchers don't work for uniqueness, instead I try to save two
  # identical objects
  # https://github.com/thoughtbot/shoulda-matchers/blob/master/lib/shoulda/matchers/active_record/validate_uniqueness_of_matcher.rb
  # it 'should validate uniqueness of username' do
  #   user = build(:user)
  #   expect(user.valid?).to be true
  #   user2 = build(:user)
  #   user.save
  #   expect(user2.valid?).to be false
  # end

  it 'should have a full_name virtual attribute' do
    user = build(:user)
    expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
  end
end
