string = 'AaBbCc'


# define a method on one object
def string.method_missing( method_name )
  "you tried to call #{method_name.inspect}, which doesn't exist"
end

string.downcase              # => "aabbcc"
string.no_downcase           # => "you tried to call :no_downcase, which doesn't exist"


# create the method we are missing
def string.no_downcase
  gsub( /[a-z]/ , ' ' )
end

string.no_downcase           # => "A B C "


# remove the method we created
class << string
  remove_method :no_downcase
end

string.no_downcase           # => "you tried to call :no_downcase, which doesn't exist"
