# this is file1
puts "beginning of file1"
# $LOAD_PATH.unshift File.dirname(__FILE__)
require 'file2'
puts "end of file1"
