require_relative 'knights_travails'

$knight = "\u265E"
$clear = "\e[2J\e[1;1H"

class Board
  attr_accessor :pos
  
  class Cell
    attr_accessor :mark
    def initialize
      @mark = " "
    end
  end

  class Column 
    attr_accessor :rows

    def initialize
      @rows = []
      8.times { @rows << Cell.new }
    end

    def [](i)
      return @rows[i]
    end
  end

  def initialize
    @pos = []
    8.times { @pos << Column.new }
  end

  def update(ar=[])
    @pos[ar[0]][ar[1]].mark = $knight
  end

  def reset
    @pos.each do |col|
      col.rows.each do |cell|
        cell.mark = " "
      end
    end
  end
end 

def print_board(b)
  print $clear
  print "    "
  (0..7).each { |i| print " #{i}  " }
  print "\n    --------------------------------\n"

  (0..7).each do |y|
    print " #{y} |"

    (0..7).each do |x|
      print " #{b.pos[x][y].mark} |"
    end

    print "\n    --------------------------------\n"
  end
end

board = Board.new

loop do
  print $clear
  puts "Start position (x,y):"
  _start = gets.strip.split(',')
  break if _start[0] == "exit"
  _start.each_with_index { |e, i| _start[i] = e.to_i } 
  
  print $clear
  puts "End position (x,y):"
  _end = gets.strip.split(',')
  _end.each_with_index { |e, i| _end[i] = e.to_i } 
  
  moves = knight_moves(_start, _end)
  
  moves.each do |move|
    board.update(move)
    print_board(board)
    puts moves.inspect
    gets
    board.reset
  end
end
