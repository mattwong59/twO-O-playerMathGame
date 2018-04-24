class Game
  attr_reader :num_of_players

  def initialize(num_of_players)
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def play_game
    question = Question.new
    question.ask_question
    user_answer = $stdin.gets.chomp
    if question.verify_answer(user_answer)
      puts "YES! You are correct."
    else
      puts "Womp womp you lost 1 life!"
      @current_player.lives -= 1
    end
  end

  def start
    while @player1.is_alive and @player2.is_alive
      play_game
    end
  end
end





