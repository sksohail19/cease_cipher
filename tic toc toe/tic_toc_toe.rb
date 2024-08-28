class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end

  def play
    loop do
      print_board
      player_move
      if winner?
        print_board
        puts "Player #{@current_player} wins!"
        break
      elsif tie?
        print_board
        puts "It's a tie!"
        break
      end
      switch_player
    end
  end

  private

  def print_board
    puts "\nBoard:"
    @board.each do |row|
      puts row.join(' | ')
      puts '---------'
    end
  end

  def player_move
    row, col = nil, nil
    loop do
      puts "Player #{@current_player}, enter your move (row and column):"
      row, col = gets.chomp.split.map(&:to_i)
      break if valid_move?(row, col)
      puts "Invalid move. Try again."
    end
    @board[row][col] = @current_player
  end

  def valid_move?(row, col)
    (0..2).include?(row) && (0..2).include?(col) && @board[row][col] == ' '
  end

  def winner?
    winning_lines.any? do |line|
      line.uniq.size == 1 && line.first != ' '
    end
  end

  def tie?
    @board.flatten.none? { |cell| cell == ' ' }
  end

  def winning_lines
    rows + columns + diagonals
  end

  def rows
    @board
  end

  def columns
    @board.transpose
  end

  def diagonals
    [[@board[0][0], @board[1][1], @board[2][2]],
     [@board[0][2], @board[1][1], @board[2][0]]]
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end

# Start the game
game = TicTacToe.new
game.play
