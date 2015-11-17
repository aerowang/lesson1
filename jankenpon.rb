require "pry"

def Welcome()
  # Welcome banner
  puts "************************************"
  puts "*                                  *"
  puts "*  Let's play Rock Paper Scissors  *"
  puts "*                                  *"
  puts "************************************"
end 

Welcome()

again = "Y"
until again == "N"
  puts "Please enter (P/R/S):"
  # Get user input
  print "Player> "
  player = gets.chomp.upcase
  # Get computer input
  letter = ["P", "R", "S"]
  computer = letter[rand(0..2)]
  puts "Computer> #{computer}"
  
  # Judge the result
  print "Resute: "
  if(player=="R" && computer=="S") ||
    (player=="P" && computer=="R") ||
    (player=="S" && computer=="P")
      puts "You win;)"
  elsif(player=="R" && computer=="P") ||
    (player=="P" && computer=="S") ||
    (player=="S" && computer=="R")
      puts "You lose:("
  else
      puts "Deuce"
  end

  # Ask player want to play again?
  puts "\nDo you want to play again? (Y/N)"
  print "> "
  again = gets.chomp.upcase
  puts "\n************************************"
  if again == "N"
    break
  end
  # binding.pry
end

puts "\nHave a nice day!\n\n"
