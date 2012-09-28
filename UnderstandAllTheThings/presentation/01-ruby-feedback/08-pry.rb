class User
  attr_accessor :email, :posts
  def initialize(email, posts)
    self.email, self.posts = email, posts
  end
  
  def recent_post
    posts.last
  end
end

class Post
  attr_accessor :title
  def initialize(title)
    self.title = title
  end
end

user = User.new 'josh@example.com', [Post.new('Hello'), Post.new('World')]

require 'pry'
binding.pry