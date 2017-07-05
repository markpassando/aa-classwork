require_relative 'piece'
require_relative 'cursor'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_grid(@grid)
  end

  def generate_backline(pos)
    row, col = pos

    case col
    when 0,7
      #Rook
      Rook.new(self, pos)
    when 1, 6
      #Bishop
      Bishop.new(self, pos)
    when 2,5
      #Knight
      Knight.new(self, pos)
    when 3
      #King
      King.new(self, pos)
    when 4
      #queen
      Queen.new(self, pos)
    end

  end

  def populate_grid(grid)
    grid.each_with_index do |row,i|
      if i == 1 || i == 6
        row.map!.with_index do |space, j|

          space = Pawn.new(self, [i, j], :black)
        end
      elsif i == 0 || i == 7
        row.map!.with_index do |space, j|
          #debugger
          space = generate_backline([i, j])
          #space = Pawn.new(self, [i, j], :black)
        end
      else
        row.map!.with_index do |space, j|
          space = NullPiece.instance
        end
      end
    end

    grid[6..7].each do |row|
      row.each do |piece|
        piece.color = :white
      end
    end
  end

  # def populate_grid(pos, grid)
  #   grid.each_with_index do |row,i|
  #     if i == 0 || i == 1 || i == 6 || i == 7
  #       row.map!.with_index do |space, j|
  #         #come back to this color :black when we add white player
  #         space = Pawn.new(self, [i, j], :black)
  #       end
  #     else
  #       row.map!.with_index do |space, j|
  #         space = NullPiece.instance
  #       end
  #     end
  #   end
  # end

  def move_piece(start_pos,end_pos)
    # debugger
    raise "No piece at start position" if self[start_pos].is_a?(NullPiece)
    raise "Piece can not move there" unless valid_move?(start_pos)
    current_piece = self[start_pos]

    self[end_pos] = current_piece
    self[start_pos] = NullPiece.instance
  end

  def valid_move?(pos)
    #debugger
    return true if pos.all? { |el| el.between?(0, 7)}
    false
  end

  def [](pos)
    #debugger
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,val)
    row,col = pos
    @grid[row][col] = val
  end
end
