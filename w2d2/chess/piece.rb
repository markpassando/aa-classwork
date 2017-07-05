require_relative 'stepable'
require_relative 'slideable'
require 'Singleton'

class Piece
  attr_accessor :start_pos, :current_pos, :color, :board
  def initialize(board, start_pos, color=:black)
    @board = board
    @start_pos = start_pos
    @current_pos = @start_pos
    @color = color
    #@color = color
    #board step 3

  end

  def to_s
    self.symbol
  end

  def empty?

  end

  def symbol

  end

  def valid_moves
    # debugger
    possible_moves = self.moves
    possible_moves.select do |pos_mov|
      pos_move_object = @board[pos_mov]
      pos_mov.all? { |num| num.between?(0, 7) } && pos_move_object.color != self.color
    end

  end

  def move_into_check(to_pos)

  end

  def get_moves

  end
end

class King < Piece
  include Stepable

  def symbol
    :K
  end

  def move_diffs
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1],
    ]
  end
end

class Knight < Piece
  include Stepable

  def symbol
    :n
  end

  def move_diffs
    [
      [-2, -1],
      [-2,  1],
      [-1, -2],
      [-1,  2],
      [ 1, -2],
      [ 1,  2],
      [ 2, -1],
      [ 2,  1]
    ]
  end
end

class Rook < Piece
  include Slideable

  def symbol
    :R
  end

  def move_dirs
    [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ]
  end
end

class Bishop < Piece
  include Slideable

  def symbol
    :B
  end

  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end
end

class Queen < Piece
  include Slideable

  def symbol
    :Q
  end

  def move_dirs
    [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end
end

class Pawn < Piece

  def symbol
    :P
  end

  # def moves
  #   cur_x, cur_y = self.current_pos
  #   self.move_diffs.map do |pos|
  #     dx,dy = pos
  #     [cur_x + dx,cur_y + dy]
  #   end
  # end

  def moves
    #debugger
    cur_x, cur_y = self.current_pos

    regular_moves = diffs.map do |pos|
      dx, dy = pos
      [cur_x + dx,cur_y + dy]
    end
    regular_moves.select! { |pos| self.board[pos].is_a?(NullPiece) }

    attack_moves = side_attacks.map do |pos|
      dx, dy = pos
      [cur_x + dx,cur_y + dy]
    end
    attack_moves.select! { |pos| self.board[pos].color != self.color && !self.board[pos].is_a?(NullPiece)}

    attack_moves.concat(regular_moves)
  end


  def at_start_row?
    cur_x, cur_y = self.current_pos
    return true if self.color == :black && cur_x == 1
    return true if self.color == :white && cur_x == 6
    false
  end

  def diffs
    result = []
    result << forward_dir
    result.flatten(1)
  end

  def forward_dir
    # color == black? [[1,0]] (if nullpiece)
    # color == white? [[-1,0]] (if nullpiece)
    result = []
    if self.color == :black
       result << [1,0]
       result << [2,0]  if at_start_row?
    else
      result << [-1,0]
      result << [-2,0]  if at_start_row?
    end
    result
  end

  def forward_steps
  end

  def side_attacks
    if self.color == :black
      [[1, -1], [1, 1]]
    else
      [[-1,0], [-1, -1]]
    end
    #color == black? [[1,0],[1,1]].all? (not NullPiece && color not yours)
    #color == white? [[-1,-1][-1,1]] (not NullPiece && color not yours)
  end
end


class NullPiece < Piece
  include Singleton

  def initialize
  end

  def moves
  end
end
