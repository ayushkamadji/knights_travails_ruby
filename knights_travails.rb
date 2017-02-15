def knight_moves(s_pos, e_pos)
  queue_m = [[s_pos]]
  offset = [[-2,1],[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1]]

  loop do
    tmp_move = queue_m.shift
    tmp_e_pos = tmp_move.last

    return tmp_move if tmp_e_pos == e_pos

    x = tmp_e_pos.first
    y = tmp_e_pos.last
    
    offset.each do |xo, yo|
      if (x + xo).between?(0,7) && (y + yo).between?(0,7)
        queue_m << (tmp_move + [[x + xo, y + yo]])
      end
    end
  end
end
