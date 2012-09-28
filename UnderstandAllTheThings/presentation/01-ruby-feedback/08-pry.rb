Post = Struct.new :title

class User
  attr_accessor :email, :posts
  def initialize(email, posts)
    self.email, self.posts = email, posts
  end
  
  def recent_post
    posts.last
  end
end

user = User.new 'josh@example.com', [Post.new('Hello'), Post.new('World')]

# show-source, ls, cd
require 'pry'
binding.pry