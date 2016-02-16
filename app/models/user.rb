class User < ActiveRecord::Base
has_secure_password
has_many :students, foreign_key: :teacher_id

validates_presence_of :first_name, :last_name, :username, :password_digest
validates :username, :uniqueness => true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
