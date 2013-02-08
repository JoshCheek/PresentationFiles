class User
  def initialize(name)
    @name = name
  end

  def inspect
    "#<A User named #{@name.inspect}>"
  end
end
