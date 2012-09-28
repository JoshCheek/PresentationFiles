class User
  attr_accessor :email, :password
  
  def initialize(email, password)
    self.email, self.password = email, password
  end
end

user = User.new 'josh@example.com', 'secret'
user.email    # => "josh@example.com"
user.password # => "secret"
# remove boiler plate with a struct
