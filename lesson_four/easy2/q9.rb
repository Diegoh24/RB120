class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def play
    puts "overriden"
  end

  def rules_of_play
    #rules of play
  end
end

Bingo.new.play
#would override the play method in the superclass, unless the 'super' keyword is uncluded.