class GameMaster

  def speak(text)
    print text + "\n"
  end

  def prompt
    answer = $stdin.gets.chomp
  end
end