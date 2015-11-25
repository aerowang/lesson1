require 'pry'

def ErrorMessage
  puts "Sorry, unexpected case occurred."
end

class Player
  # attr_accessor :name, :gesture
  @name = nil
  @gesture = nil

  def get_gesture
    @gesture
  end
end

class Human < Player
  def set_name
    puts "What's your name?"
    print "> "
    @name = gets.chomp.capitalize
    puts ""
  end

  def set_gesture
    begin
      puts "Please enter (R/P/S)."
      print "#{@name}> "
      @gesture = gets.chomp.upcase
      puts ""
    end while !["R", "P", "S"].include? @gesture
  end
end

class Computer < Player
  def set_name
    @name ||= ["Amanda", "Bella", "Chloe"].shuffle.first
  end

  def set_gesture
    @gesture = ["R", "P", "S"].shuffle.last
    puts "#{@name}> #{@gesture}"
    puts ""
  end
end

class Game
  @score
  
  def initialize
    @score = {"win" => 0, "deuce" => 0, "lose" => 0}  
  end

  def introduce
    puts "************************************"
    puts "*                                  *"
    puts "*  Let's play Rock Paper Scissors  *"
    puts "*                                  *"
    puts "************************************"
  end

  def judge(player1, player2)
    case player1.get_gesture
    when "R"
      case player2.get_gesture
      when "R" then result = "deuce"
      when "P" then result = "lose"
      when "S" then result = "win"
      else ErrorMessage end
    when "P"
      case player2.get_gesture
      when "R" then result = "win"
      when "P" then result = "deuce"
      when "S" then result = "lose"
      else ErrorMessage end
    when "S"
      case player2.get_gesture
      when "R" then result = "lose"
      when "P" then result = "win"
      when "S" then result = "deuce"
      else ErrorMessage end
    else 
      ErrorMessage
    end
    
    case result
    when "win" then puts "You Win;)"
    when "deuce" then puts "Deuse:o"
    when "lose" then puts "You lose:("
    else ErrorMessage end
    puts ""

    @score[result] += 1
  end

  def continue?
    puts "===================================="
    puts "Do you want to play again? (Y/N)"
    print "> "
    answer = gets.chomp.upcase
    puts ""
    answer == "Y"
  end

  def gameover
    puts "Total:"
    print "    Win: #{@score["win"]}"
    print "    Deuce: #{@score["deuce"]}"
    print "    Lose: #{@score["lose"]}\n"
    puts ""
    puts "Bye, Have a nice day!"
    puts ""
  end

  def play(player1, player2)
    self.introduce
    player1.set_name
    player2.set_name
    begin
      player1.set_gesture
      player2.set_gesture
      self.judge(player1, player2)
    end while self.continue?
    self.gameover
  end
end

############### main block ###############
shinohana_natsuki = Human.new
love_machine = Computer.new
game = Game.new
game.play(shinohana_natsuki, love_machine)