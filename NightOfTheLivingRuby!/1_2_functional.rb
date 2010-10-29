# FUNCTIONAL!

5.times do
  puts "Hello, Rubiverse!"
end

sum = 0
1.upto 10 do |i|
  sum += i
end
sum # => 55


def call_twice
  yield
  yield
end

call_twice { puts "HOWDY!"}

