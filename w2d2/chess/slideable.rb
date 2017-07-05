module Slideable
  def move_dirs
    raise "Must implement this method in class which is including this module"
  end

  def moves
    result = []
    self.move_dirs.each do |pos|
      dx, dy = pos
        result.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
    result
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = self.current_pos
    result = []
    horiz_incr = dx
    vert_incr = dy

    loop do
      next_pos = [cur_x + dx, cur_y + dy]

      if next_pos.any? { |coord| !coord.between?(0,7) }
        break
      #elsif @board[next_pos].color == self.color
        #break
      #elsif @board[next_pos].color != self.color
        #result << next_pos
        #break
      end
      result << next_pos
      dx += horiz_incr
      dy += vert_incr
    end

    result
  end
end
