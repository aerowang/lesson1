require "pry"

def Welcome()
  puts "************************************"
  puts "*                                  *"
  puts "*  Let's play Rock Paper Scissors  *"
  puts "*                                  *"
  puts "************************************"
  puts ""
end 

def PlayerInput()
  gesture = ["P", "R", "S"]

  begin
    puts "Please enter (P/R/S)."
    print "Player> "
    player_input = gets.chomp.upcase
    if gesture.include? (player_input)
      break
    end
  end while !gesture.include? (player_input)

  return player_input
end

def ComputerInput()
  gesture = ["P", "R", "S"]

  random_num = rand(0..2)
  gesture = ["P", "R", "S"]
  computer_input = gesture[random_num]
  puts "Computer> #{computer_input}"
  
  return computer_input
end

def Judge(player, computer)
  print "Result: "
  if(player=="R" && computer=="S") ||
    (player=="P" && computer=="R") ||
    (player=="S" && computer=="P")
      puts "You win;)"
      return "win"
  elsif(player=="R" && computer=="P") ||
    (player=="P" && computer=="S") ||
    (player=="S" && computer=="R")
      puts "You lose:("
      return "lose"
  else
      puts "Deuce"
      return "deuce"
  end
end

def Ending(score)
  puts "    Total:"
  puts "           Win: #{score["win"]}"
  puts "          Lose: #{score["lose"]}"
  puts "         Deuce: #{score["deuce"]}"
  puts ""
  puts "************************************"
  puts "*                                  *"
  puts "*         Have a nice day!         *"
  puts "*                                  *"
  puts "************************************"
end


Welcome()
score = {"win"=>0, "lose"=>0, "deuce"=>0}
again = "Y"
until again == "N"
  player_input = PlayerInput()
  computer_input = ComputerInput()
  result = Judge(player_input, computer_input)
  score[result] += 1

  puts "\nDo you want to play again? (Y/N)"
  print "> "
  again = gets.chomp.upcase
  puts "************************************"
end

Ending(score)
# binding.pry