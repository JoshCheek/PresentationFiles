Shoes.app :width => 1180 , :height => 800 , :resizable => false do
  
  
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
    def initialize(app)
      @app = app
      @rotation = 0
      @image = app.image('zombie.png') { bonk! }
      @image.move -500 , 75
    end
    def bonk!
      @app.increment_bonk_count
      @image.left -= 150 
    end
    def draw
      new_rotation = rand(30)-10
      @image.rotate new_rotation - @rotation
      @rotation = new_rotation
      @image.left += ( @rotation > 0 ? @rotation : @rotation/2 ) + 10
    end
    def has_ruby?
      @image.left > 550
    end
  end
  
  
  class BonkStick
    def initialize(app)
      @up = true                    # track whether stick is up or down
      @x = @y = -50
      @image = app.image 'club.png'
      app.click   { bonk!   }       # register for when the mouse is clicked
      app.release { unbonk! }       # register for when the mouse is clicked
      app.motion &method(:move)     # register for whent he mouse is moved
      move                          # initially place the bonk stick offscreen
    end
    def bonk!
      down!
      move
    end
    def unbonk!
      up!
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
    def up?
      @up
    end
    def down!
      @image.rotate 90
      @up = false
    end
    def up!
      @image.rotate -90
      @up = true
    end
  end
  
  class BonkDisplay
    attr_reader :count
    def initialize(app)
      @app = app
      @paragraph = @app.para "BONK! COUNT: 0" , :stroke => app.red , :size => 20
      @paragraph.move 900 , 725
      @count = 0
    end
    def increment
      @count += 1
      @paragraph.replace "BONK! COUNT: #{@count}"
    end
  end
  
  
  # the background
  background "haunted_forest.jpg"
  
  # the title
  font 'Deanna.ttf'
  title 'NIGHT OF THE LIVING RUBY!' , :align => 'center' , :font => 'Deanna' , :height => 100 , :size => 75 , :stroke => red
  
  # app methods
  @bonker = BonkDisplay.new self
  def increment_bonk_count
    @bonker.increment
  end
  def game_over
    alert "ZOMBIE HAS RUBY!\n\nGame over, your BONK! count was #{@bonker.count}."
    close
  end
  
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
