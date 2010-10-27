# TODO
# * display background
# * have club bounce back up after I let go of mouse

require 'logger'
def log(str) 
  $logger ||= Logger.new("meta.log")
  $logger.info str.to_s
end



Shoes.app :width => 1200 , :height => 800 , :resizable => false do
  
  
  class DancingRuby
    def initialize(app)
      @image = app.image 'ruby.png'
      @image.move 900 , 350
      @image.rotate -15
      @i = 0
    end
    def get_rotation(rotation)
      if rotation % 4 < 2
        15 
      else
        -15
      end
    end
    def draw
      @image.rotate( get_rotation @i )
      @i += 1
      @i %= 4
    end
  end
  
  
  class HungryZombie
    attr_accessor :bonk_count
    def initialize(app)
      @bonk_count = @rotation = 0
      @x = -500
      @y = 50
      @image = app.image('zombie.png') { bonk! }
      @image.move @x , @y
    end
    def bonk!
      @bonk_count += 1
      @x -= 150 
    end
    def draw
      new_rotation = rand(30)-10
      @image.rotate new_rotation - @rotation
      @rotation = new_rotation
      @x += ( @rotation > 0 ? @rotation : @rotation/2 ) + 10
      @image.move @x , @y
    end
    def has_ruby?
      @x > 550
    end
  end
  
  
  class BonkStick
    def initialize(app)
      @up = true
      @x = @y = 500
      @image = app.image 'club.png'
      app.click { bonk! }
      follow_mouse app
    end
    def bonk!
      if up?
        @image.rotate 90
        down!
      else
        @image.rotate -90
        up!
      end
      move
    end
    def move(x=@x,y=@y)
      @x , @y = x , y
      if up?
        @image.move @x-105 , @y-180
      else
        @image.move @x-180 , @y-105
      end
    end
    def follow_mouse(app)
      app.motion &method(:move)
    end
    def up?
      @up
    end
    def down!
      @up = false
    end
    def up!
      @up = true
    end
  end
  
  
  def game_over
    alert "ZOMBIE HAS RUBY!\n\nGame over, your BONK! count was #{@zombie.bonk_count}."
    close
  end
  
  # the background
  # background( image "haunted_forest.jpg" , :width => '100%' , :height => '100%' )
  background "haunted_forest.jpg"

  # the title
  font 'Deanna.ttf'
  para "Night of the Living Ruby" , :align => 'center' , :font => 'Deanna' , :height => 100 , :size => 75 , :stroke => red

  # the zombie
  @zombie = HungryZombie.new self
  animate 10 do 
    @zombie.draw
    game_over if @zombie.has_ruby?
  end

  # the ruby
  @dancing_ruby = DancingRuby.new self
  animate(2) { @dancing_ruby.draw }
  
  # the club
  @club = BonkStick.new self
    
end
