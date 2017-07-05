module Stepable
  def move_diffs
    raise "Must implement this method in class which is including this module"
  end

  def moves
    cur_x, cur_y = self.current_pos
    self.move_diffs.map do |pos|
      dx,dy = pos
      [cur_x + dx,cur_y + dy]
    end
  end
end
