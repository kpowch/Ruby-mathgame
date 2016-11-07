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
  PLAYERS = ["Player 1", "Player 2"]
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
    @players = []
  end

  def start_game
    @gm.speak(GameConstants::INTRO)
    set_player_names
  end

  def set_player_names
    GameConstants::PLAYERS.each { |player|
     @gm.speak("Please Enter Your Name, #{player} : ")
      @players << @gm.prompt
    }
    @gm.speak("your names are: " + @players.join(", ") + " is that correct? (y or n)")
    answer = @gm.prompt
    if answer == "y"
     @gm.speak("Great! let us begin!")
    elsif answer == "n"
      set_player_names
    else
     @gm.speak("please answer with 'y' or 'n' only")
      set_player_names
    end
  end
end
game = Game.new
game.start_game