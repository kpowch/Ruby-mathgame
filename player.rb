module GameConstants
  INTRO =
    """
    Welcome to the math game!
    You will be pitted against each other
    in some seriously bloody math evaluating action...
    \t the subject of the game is to evaluate a sum which
    is generated at random.. its not going to be easy and the
    consequences for losing are dire...
    """
end
class Player
  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
  end
end

class GameMaster

  def speak(text)
    print text + "\n"
  end

  def prompt
    answer = $stdin.gets.chomp
  end
end

class Game

  def initialize
    @gm = GameMaster.new
    @q = QuestionMaster.new
    @player1 = nil
    @player2 = nil
    @continue_game = true
    @turn = 1
  end

  def start_game
    @gm.speak(GameConstants::INTRO)
    set_player_names
    while(@continue_game == true)
      @continue_game = get_question
    end
  end

  def set_player_names
    @gm.speak("Please Enter Your Name, Player 1 : ")
    name = @gm.prompt
    @player1 = Player.new(name)

    @gm.speak("Please Enter Your Name, Player 2 : ")
    name = @gm.prompt
    @player2 = Player.new(name)

    @gm.speak("your names are: #{@player1.name} and #{@player2.name}  is that correct? (y or n)")

    answer = @gm.prompt

    if answer == "y"
     @gm.speak("Great! let us begin!")
    elsif answer == "n"
      set_player_names
    else
     @gm.speak(   "please answer with 'y' or 'n' only")
      set_player_names
    end
  end

  def get_question
    player = nil
    if @turn == 1
      player = @player1
    elsif @turn == -1
      player = @player2
    end
    @gm.speak(player.name + ": its your turn, answer me this..")
    question = @q.makeQuestion
    @gm.speak(question)
    answer = @gm.prompt.to_i
    if answer == @q.answer
      @gm.speak("Correct! \n Next Question...")
      @turn = @turn * -1
      true
    else

      @turn = @turn * -1
      player.lives -= 1
      @gm.speak("")
      check_player_life(player)
    end
  end

  def check_player_life(player)
    player.lives > 0? true : false
    # puts "yes"
  end
end

class QuestionMaster
  attr_reader :currentQuestion, :answer

  def initialize
    @currentQuestion = nil
    @answer = nil
  end

  def makeQuestion
    n1 = 1 + rand(20)
    n2 = 1 + rand(20)
    setAnswer(n1, n2)
    @currentQuestion = "what does #{n1} plus #{n2} equal?"
  end

  private

  def setAnswer(n1, n2)
    @answer = n1 + n2
  end

end
game = Game.new
game.start_game

