User = Struct.new :email, :password
user = User.new 'name@example.com', 'secret'

require 'pbcopy'
require 'pry'
binding.pry
