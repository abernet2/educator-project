class User < ActiveRecord::Base
  has_secure_password
  has_many :students, foreign_key: :teacher_id

  validates_presence_of :first_name, :last_name, :username, :password_digest
  validates :username, :uniqueness => true
  has_attached_file :photo, styles: { medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /^image\/(png|gif|jpeg|jpg)/
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
