class User < ActiveRecord::Base
  has_secure_password
  has_many :students, foreign_key: :teacher_id

  validates_presence_of :first_name, :last_name, :username, :password_digest
  validates :username, :uniqueness => true
  has_attached_file :photo, styles: { medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /^image\/(png|gif|jpeg|jpg)/

  before_validation :authentication_token, :on => :create


  def authentication_token=(token)
    @given_token = token
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
  def authentication_token
    unless @given_token == ENV['USER_REGISTRATION_TOKEN']
      errors.add(:authentication, "Invalid or missing authentication token")
    end
  end
end
