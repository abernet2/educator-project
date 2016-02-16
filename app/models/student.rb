class Student < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :gpa, presence: true
  validates :detentions, presence: true
  validates :gender, presence: true
end
