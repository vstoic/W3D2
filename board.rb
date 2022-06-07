require_relative "./card.rb"

class Board 
  attr_reader :grid, :size
  def initialize(board_size)
    @grid = Array.new(board_size){ Array.new(board_size,"")}
    @size = board_size * board_size
    raise "board size should be even number!" if board_size.odd?
    @single_cards_array = (0...(@size / 2)).map {|times| Card.new }
    
    # array_to_be_shuffled = []
    #     .times do 
    #       array_to_be_shuffled << Card.new.face_value
    #     end
  end
  
  def populate
    shuffled_array = (@single_cards_array*2).shuffle     #multiplying the array of the board cards shuffled
    i = 0
    while i < shuffled_array.length 
      (0...@grid.length).each do |idx1|
        (0...@grid.length).each do |idx2|
          @grid[idx1][idx2] = shuffled_array[i]  #.face_value
          i += 1
        end
      end
    end

  end


  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def show_card(pos)
    @grid[pos].reveal
    print_current
  end
  

  def print_current
    arr = []
    @grid.each do|rows|
      sub_arr = []
      rows.each do |pos|
        if pos.face_up == true
            sub_arr << pos.face_value
        else
          sub_arr << "_"
        end
      end
      arr << sub_arr
    end
    print(arr)
  end

  

  def won?
    @grid.flatten.all? { |card| card.face_up == true }
  end

  
  def print(grid)
    grid.each do |row|
        puts row.join(" ")
      end
    end

end