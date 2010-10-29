# show how to find and install a gem

require 'rubygems'
require 'tweetstream'
require 'ruby-growl'
require File.dirname(__FILE__) + '/.twitter-password'

client = TweetStream::Client.new 'wsuacm' , PASSWORD

client.follow 136877878 do |tweet|
  g = Growl.new 'localhost', 'growltweet', ['tweet']
  g.notify 'tweet' , tweet.user.screen_name , tweet.text
end