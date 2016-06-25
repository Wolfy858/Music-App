class User < ActiveRecord::Base

  validates :email, :username, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(secret)
    @password= BCrypt::Password.create(secret)
    self.password_digest = @password
  end

end
