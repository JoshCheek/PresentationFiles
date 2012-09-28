class User
  attr_accessor :email, :password
  
  def initialize(email, password)
    self.email, self.password = email, password
  end
end

# remove boiler plate with a struct