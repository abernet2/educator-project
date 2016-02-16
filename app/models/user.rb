class User < ActiveRecord::Base
has_secure_password
has_many :students, foreign_key: :teacher_id

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
