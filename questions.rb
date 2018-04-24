class Question
  attr_reader :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def printQuestion
    puts "What does #{@num1} plus #{@num2} equal?"
    print "> "
    user_answer = $stdin.gets.chomp

    if user_answer == "#{@num1 + num2}"
      puts "YES! You are correct."
    else
      puts "Womp womp you lost 1 life!"
    end

  end
end

q1 = Question.new
q1.printQuestion
