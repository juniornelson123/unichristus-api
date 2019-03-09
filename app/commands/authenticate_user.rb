class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email, @password = email, password
  end

  def call
    {token: JsonWebToken.encode(user_id: user.id), user: user} if user
  end

  private
  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.valid_password?(password)
    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end