class Student < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :grade
  validates_presence_of :gpa
  validates_presence_of :detentions
  validates_presence_of :gender
end
