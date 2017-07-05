require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  attr_accessor :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end
 #loop
 #call render
 #call cursor input
  def test_loop
    loop do
      render
      @cursor.get_input
    end
  end
 #render def
 #clear
 #then render
 def render
   #debugger
   cursor_pos = @cursor.cursor_pos

   system("clear")
   puts "   0   1   2   3   4   5   6   7"
   @board.grid.each_with_index do |row, i|
     print "#{i}"
     row.each_with_index do |col, j|
       if col.class != NullPiece
         if cursor_pos == [i, j]
           print "|" + " #{col.to_s} ".colorize(:color => :red, :background => :light_yellow)
         else
           print "|" + " #{col.to_s} "
         end
       else
         if cursor_pos == [i, j]
           print "|" + "   ".colorize(:color => :red, :background => :light_yellow)
         else
           print "|" + "   "
         end
       end
     end

     print "|\n"
     puts "   -  -  -  -  -  -  -  -  -  -  -"
   end

 end


end

if __FILE__ == $PROGRAM_FILE
  d = Display.new
end
