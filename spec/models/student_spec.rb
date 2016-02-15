require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :grade }
  it { should validate_presence_of :gpa }
  it { should validate_presence_of :detentions }
  it { should validate_presence_of :gender }
end
