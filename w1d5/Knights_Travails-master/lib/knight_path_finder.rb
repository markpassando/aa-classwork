require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder
  attr_accessor :board, :visited_positions, :start_pos

  def initialize(pos)
    @start_pos = PolyTreeNode.new(pos)
    @visited_positions = [pos]
  end

  def valid_moves(pos)
    row, col = pos
    valid_row = (row >= 0 && row <= 7)
    valid_col = (col >= 0 && col <= 7)

    if valid_row && valid_col
      return true
    end

    false
  end

  def new_move_positions(pos)
    row, col = pos.value
    poss_moves = [
      [row - 2, col - 1],
      [row - 2, col + 1],
      [row - 1, col - 2],
      [row + 1, col - 2],
      [row + 2, col - 1],
      [row + 2, col + 1],
      [row + 1, col + 2],
      [row - 1, col + 2]
    ]

    valid_positions = poss_moves.select { |move| valid_moves(move) }
    not_visited_pos = valid_positions.reject { |move| visited_positions.include?(move) }

    visited_positions.concat(not_visited_pos)
    not_visited_pos
    #debugger
  end

  # def bfs(target_value)
  #   queue = [self]
  #
  #   until queue.empty?
  #     queue.each do |node|
  #       first = queue.shift
  #       return first if first.value == target_value
  #       queue.concat(first.children)
  #     end
  #   end
  #
  #   nil
  # end

  def build_move_tree
    poss_moves = new_move_positions(@start_pos)
    # until possible moves is empty, create children.
    # poss_moves each
        # get first possible move and shift it, and then assign parents and add children
        # then add first.children to possible moves

    until poss_moves.empty?
      poss_moves.each do |move|
        debugger
        first_move = PolyTreeNode.new(poss_moves.shift)
        first_move.parent = @start_pos
        @start_pos.add_child(first_move)
        poss_moves.concat(first_move.children) unless first_move.children.empty?
        #first_move.childern doesnt know his kids
        #need to call new_move_positions(first_move)
      end
    end


    # until visited_positions includes self(aka end_pos) keep going
    # poss_moves.map! do |move|
    #   node = PolyTreeNode.new(move)
    #   node.parent = @start_pos
    #   @start_pos.add_child(node)
    # end
  end

end
