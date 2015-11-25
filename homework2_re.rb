require 'pry'

def ErrorMessage
  puts "Sorry, unexpected case occurred."
end

class Player
  attr_accessor :name, :age
  @name = nil
  @gesture = nil
end

class Human < Player
  def name=
    puts "What's your name?"
    print "> "
    @name = gets.chomp.capitalize
    puts ""
  end

  def geture=
    puts "Please enter R/P/S."
    print "> "
    @gesture = gets.chomp.upcase
    puts ""
  end

end

class Computer < Player
  def name=
    @name ||= ["Amanda", "Bella", "Chloe"].shuffle.first
  end

  def gesture=
    @gesture = ["R", "P", "S"].shuffle.last
  end
end

class Game
  @score = {"win" => 0, "deuce" => 0, "lose" => 0}
  
  def introduce
    puts "************************************"
    puts "*                                  *"
    puts "*  Let's play Rock Paper Scissors  *"
    puts "*                                  *"
    puts "************************************"
  end

  def judge(gesture1, gesture2)
    case gesture1
    when "R"
      case gesture2
      when "R" then result = "deuce"
      when "P" then result = "lose"
      when "S" then result = "win"
      else ErrorMessage end
    when "P"
      case gesture2
      when "R" then result = "win"
      when "P" then result = "deuce"
      when "S" then result = "lose"
      else ErrorMessage end
    when "S"
      case gesture2
      when "R" then result = "lose"
      when "P" then result = "win"
      when "S" then result = "deuce"
      else ErrorMessage end
    else 
      ErrorMessage
    end
    @score[result] += 1
  end

  def continue?
    puts "Do you want to play again?(Y/N)"
    print "> "
    answer = gets.chomp.upcase
    puts ""
    answer == "Y"
  end

  def gameover
    puts "Total:"
    puts "  Win: #{score["win"]}"
    puts "Deuce: #{score["deuce"]}"
    puts " Lose: #{score["lose"]}"
    puts ""
    puts "Bye, Have a nice day!"
  end

  def play(player1, player2)
    self.introduce

    player1.name=
    player2.name=
    binding.pry
    begin
      player1.gesture=
      player2.gesture=
      self.judge(player1, player2)
    end while self.continue?

  end
end

shinohana_natsuki = Human.new
love_machine = Computer.new
game = Game.new
game.play(shinohana_natsuki, love_machine)