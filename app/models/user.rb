class User < ActiveRecord::Base
has_secure_password

  def full_name
    "#{self.first_name} #{self.lastname}"
  end
end
