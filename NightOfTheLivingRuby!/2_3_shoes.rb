str = ""
Shoes.app :height => 500, :width => 450 do
  
  background rgb(77, 77, 77)
  
  stack :margin => 10 do
    flow do
      para " TEXT EDITOR " , :fill => white
      button("quit") { quit }
    end
    @document = para "" , :stroke => white
    @document.cursor = -1
  end
  
  keypress do |key|
    case key
    when String
      str += key
    when :backspace
      str.slice!(-1)
    when :alt_c
      self.clipboard = str
    when :alt_v
      str += self.clipboard
    end
    @document.replace str
  end
  
end
