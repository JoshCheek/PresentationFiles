# OBJECT ORIENTED!

# I am a comment! 


# numbers are objects
1.odd?    # => true
2.odd?    # => false
1.even?   # => false
2.even?   # => true


# classes are objects
String.class # => Class


# methods are objects
five_odd = 1.method("odd?")
five_odd.call # => true


# operators are methods which are objects
equality = 5.method("==")
5 == 12           # => false
equality.call 12  # => false

5 == 5            # => true
equality.call 5   # => true


# everything are objects!
true.class  # => TrueClass
false.class # => FalseClass
nil.class   # => NilClass
1.5.class   # => Float
1234567890987654323456789876543234567898765432345678909876543234567890987654323456789087654323456.class # => Bignum
