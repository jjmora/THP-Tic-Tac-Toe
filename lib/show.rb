# Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.
require 'pry'
require_relative 'board'
require_relative 'game'
require_relative 'application'

class Show
  attr_accessor :hash

  def show_board(hash)
    puts ""
    puts "   | _A_ | _B_ | _C_ |"
    puts "   |     |     |     |"
    puts " 1 |  #{hash["A1"]}  |  #{hash["B1"]}  |  #{hash["C1"]}  |"
    puts "   |     |     |     |"
    puts "   " + "-"*19 
    puts "   |     |     |     |"
    puts " 2 |  #{hash["A2"]}  |  #{hash["B2"]}  |  #{hash["C2"]}  |"
    puts "   |     |     |     |" 
    puts "   " + "-"*19
    puts "   |     |     |     |"
    puts " 3 |  #{hash["A3"]}  |  #{hash["B3"]}  |  #{hash["C3"]}  |"
    puts "   |     |     |     |"
    puts "   " + "-"*19
    puts ''
  end

  def presentation_menu
    puts "="*37
    puts "||                                 ||"
    puts "||  WELCOME TO OUR BRAND NEW GAME  ||"
    puts "||          TIC TAC TOE            ||"
    puts "||                                 ||"
    puts "="*37
    puts " "
    puts "GAME INSTRUCTIONS: 
    The game is played on a grid that's 3 squares by 3 squares.
Player1 is X, and Player 2 is O.
The first player to get 3 of her marks in a row (up, down,
across, or diagonally) is the winner. 
When all 9 squares are full, the game is over.
    "
    puts " "
    puts "Please select the Player1 and Player 2 names"
    puts " "
    puts "For selecting your play, write the letter A,B or C 
    and a number 1,2 or 3 (exemple: A1) "
    puts ""
  end

  def show_end_menu
    puts "You have finished the game !!!"
    puts "What would you like to do now ?"
    puts " > A - I loved it, i will like to play again !!!"
    puts " > X - It's too funny for me, I need some rest. Please exit the game"
    selection = gets.chomp
    return selection
  end
end

#binding.pry
