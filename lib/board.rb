# Board : c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
# à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).

# Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. 
# Il faut les lui attribuer sous forme d'un array ou d'un hash. 
# Aussi, il est utile de compter le nombre de coup joué pour identifier facilement si on arrive au 9ème coup sans vainqueur.

# Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : 
# il change les valeurs des BoardCases (de " " à "x" ou "o") 
# et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).

require_relative 'boardcase'
require_relative 'game'
require 'pry'

class Board
 attr_accessor :boardcases_hash, :turn_count, :victory_condition

  def initialize
    @turn_count = 1
    @boardcases_hash = Hash.new
    @victory_condition = false
    boardcase = BoardCase.new
    for x in (0..8) do
      @boardcases_hash[boardcase.position[x]] = boardcase.value[0]
    end    
  end

  def player_selection_hash(boardcases_hash,selection,player_sign)
    if boardcases_hash.has_key?(selection) == true && boardcases_hash[selection] == " "
      boardcases_hash[selection] = player_sign ##<= recuperer la valeur du sign des players
      puts " "
      puts "***** ROUND #{@turn_count +=1} ****"
      puts " "
    else
      puts "Bad selection. Please try again"
    end
  end

  def victory?(boardcases_hash)
    case !@victory_condition
      when boardcases_hash['A1'] == boardcases_hash['A2'] && boardcases_hash['A1'] == boardcases_hash['A3'] && boardcases_hash['A3'] != " "
        puts "You Win"
      when boardcases_hash['B1'] == boardcases_hash['B2'] && boardcases_hash['B1'] == boardcases_hash['B3'] && boardcases_hash['B3'] != " "
        puts "You Win"
      when boardcases_hash['C1'] == boardcases_hash['C2'] && boardcases_hash['C1'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "You Win"
      when boardcases_hash['A1'] == boardcases_hash['B1'] && boardcases_hash['A1'] == boardcases_hash['C1'] && boardcases_hash['C1'] != " "
        puts "You Win"
      when boardcases_hash['A2'] == boardcases_hash['B2'] && boardcases_hash['A2'] == boardcases_hash['C2'] && boardcases_hash['C2'] != " "
        puts "You Win"
      when boardcases_hash['A3'] == boardcases_hash['B3'] && boardcases_hash['A3'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "You Win"
      when boardcases_hash['A1'] == boardcases_hash['B2'] && boardcases_hash['A1'] == boardcases_hash['C3'] && boardcases_hash['C3'] != " "
        puts "You Win"
      when boardcases_hash['A3'] == boardcases_hash['B2'] && boardcases_hash['A3'] == boardcases_hash['C1'] && boardcases_hash['C1'] != " "
        puts "You Win"
    else
      puts 'Keep going !'
      false
    end
  end

end
#binding.pry