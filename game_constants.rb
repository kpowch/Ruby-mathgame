require './question'
require './player'
require './gamemaster'


class MathGame
  INTRO =
    """
    Welcome to the math game!
    You will be pitted against each other
    in some seriously bloody math evaluating action...
    \t the subject of the game is to evaluate a sum which
    is generated at random.. its not going to be easy and the
    consequences for losing are dire...
    """
  QUESTION = QuestionMaster.new
  PLAYER = Player
  GAME_MASTER = GameMaster.new
end