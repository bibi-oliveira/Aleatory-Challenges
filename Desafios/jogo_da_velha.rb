class TicTacToe
  def initialize(player_x, player_o)
    @table = [[[],[],[]],
    [[],[],[]],
    [[],[],[]]]
    @winner = nil
    @player_x = player_x
    @player_o = player_o
    @turn = 0
  end

  def show_table
    puts
    print "#{@table[0][0]}|#{@table[0][1]}|#{@table[0][2]} Row0 \n"
    print "#{@table[1][0]}|#{@table[1][1]}|#{@table[1][2]} Row1 \n"
    print "#{@table[2][0]}|#{@table[2][1]}|#{@table[2][2]} Row2 \n"
    print "Col0|Col1|col2"
    puts
  end

  def turn_change
    @turn += 1
    if @turn % 2 == 0
      return 'o'
    else
      return 'x'
    end
  end

  def winner_check
    x_winner = false
    o_winner = false
    left_diagonal = [@table[0][0], @table[1][1], @table[2][2]]
    right_diagonal = [@table[0][2], @table[1][1], @table[2][0]]
    for c in 0..2
        x_winner = @table[c].all? {  |variable|  variable == "x"}
        if x_winner == true
          break
        end
        x_winner = @table.transpose[c].all? {  |variable| variable == "x"}
        if x_winner == true
          break
        end
        x_winner = right_diagonal.all? {  |variable| variable == "x"}
        if x_winner == true
          break
        end
        x_winner = left_diagonal.all? {  |variable| variable == "x"}
        if x_winner == true
          break
        end
      #o check
        o_winner = @table.transpose[c].all? {  |variable| variable == "o"}
        if o_winner == true
          break
        end
        o_winner = @table[c].all? {  |variable|  variable == "o"}
        if o_winner == true
          break
        end
        o_winner = right_diagonal.all? {  |variable| variable == "o"}
        if o_winner == true
          break
        end
        o_winner = left_diagonal.all? {  |variable| variable == "o"}
        if o_winner == true
          break
        end
    end
    if x_winner == true
      @winner = @player_x
      return true
    end
    if o_winner == true
      @winner = @player_o
      return true
    end
  end

  def winner_message
    puts "The player #{@winner} WIN!"
  end

  def play
    show_table
    print "\n Write the row number: "
    row = gets.chomp.to_i
    print "Write the column number: "
    column = gets.chomp.to_i
    if @table[row][column].empty?
      @table[row][column] = turn_change
    else
      puts "Error, here is already filled"
    end
  end

  def check_draw
    if @table.empty?
      return true
    end
  end

  def draw_message
    puts 'Woops, Draw'
  end
end

print 'Player one: '
player_one = gets.chomp
print 'Player two'
player_two = gets.chomp

game = TicTacToe.new(player_one, player_two)
loop do
  game.play
  if game.winner_check == true
    game.show_table
    game.winner_message
    print "Continue ? [Y/N]"
    continue = gets.chomp.upcase
    if continue == 'Y'
      system "cls"
    else
      break
    end
  end
  if game.winner_check == false and game.check_draw == true
    game.show_table
    game.draw_message
    print "Continue ? [Y/N]"
    continue = gets.chomp.upcase
    if continue == 'Y'
      system "cls"
    else
      break
    end
  end
end
