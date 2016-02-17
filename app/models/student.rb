class Student < ActiveRecord::Base
  acts_as_xlsx

  belongs_to :teacher, class_name: "User"
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :gpa, presence: true
  validates :detentions, presence: true
  validates :gender, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
