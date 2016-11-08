
class QuestionMaster
  attr_reader :currentQuestion, :answer

  def initialize
    @currentQuestion = nil
    @answer = nil
  end

  def make_question
    n1 = 1 + rand(20)
    n2 = 1 + rand(20)
    set_answer(n1, n2)
    @currentQuestion = "what does #{n1} plus #{n2} equal?"
  end

  private

  def set_answer(n1, n2)
    @answer = n1 + n2
  end

end