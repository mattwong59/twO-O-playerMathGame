class Game
  attr_reader :num_of_players

  def initialize(num_of_players)
    random_name1 = ["Homer", "Marge", "Bart", "Lisa", "Maggie", "Apu"].sample
    random_name2 = ["Peter", "Meg", "Loise", "Stewie", "Chris"].sample

    @player1 = Player.new(random_name1)
    @player2 = Player.new(random_name2)
    @current_player = @player1
  end

  def new_turn
     @current_player = @current_player == @player1 ? @player2 : @player1
     puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
     puts "\n----- NEW TURN -----\n "
  end

  def play_game
    question = Question.new
    question.ask_question(@current_player.name)
    user_answer = $stdin.gets.chomp
    if question.verify_answer(user_answer)
      puts "Amazing #{@current_player.name}! You are correct."
    else
      puts "Womp womp you lost 1 life #{@current_player.name}!"
      @current_player.lives -= 1
    end
    new_turn
  end

  def end_game
    puts "#{@current_player.name} wins with #{@current_player.lives}/3 lives remaining"
    puts "---- GAME OVER -----"
    puts "Thanks for playing, see ya! \n "
  end

  def start
    while @player1.is_alive and @player2.is_alive
      play_game
    end
    end_game
  end
end
