# local_variables
# a, = 1

# instance_variables
# class Foo
#   attr_accessor :bar # how does this work?
# end

# global_variables
# global_variables #=> 

# ----------

# methods (pass false to not show inherited methods)
# logger = Object.new
# def logger.info(to_log)
#   to_log
# end

# instance_methods
# Foo.instance_methods false

# method(:whatever).owner
# logger = Object.new
# def logger.info(to_log)
# end

# so def logger.info == define_singleton_method == class << logger; def, etc

# ----------

# instance_variables
# class Foo
#   attr_accessor :name
#   def initialize(name)
#     self.name = name
#   end
# end
# foo = Foo.new 'Josh'


# instance_variable_get

# ----------

# caller
# def method1
#   method2
# end
# 
# def method2
#   caller
# end


# ----------

# constants
# class A
#   class B
#   end
# end


# included_modules
# module M
# end
# 
# class A
#   include M
# end

# class/superclass
# class X
# end
