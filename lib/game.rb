# Game : c'est le jeu. Elle initialise tout, lance une partie (qui se termine avec une victoire ou un nul), permet de jouer un tour, de chercher si la partie est finie, etc.
# cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.

# Variables d'instance :
# tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme "quel joueur doit jouer ?",
# "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.

# Méthodes :
# Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case),
# s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.
require'pry'
require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game
	attr_accessor :grid, :players, :game_status, :selection

	def initialize
	  @players = []
    @grid = Board.new
    @grid.turn_count = 1
    #creating_players
	end

  def creating_players
    puts "Please select first player's name?"
    @players << Player.new("x")
    puts "Please select second player's name?"
    @players << Player.new("o")
  end

  #Défini qui doit jouer en fonction du numéro du tour
  def who_is_playing?
    if @grid.turn_count.odd?
      @players[0]
    else
      @players[1]
    end
  end

  #vérifie le statut de la partie
  def is_going?
    if @grid.victory?(@grid.boardcases_hash) == false && @grid.turn_count < 10
      true
    else
      false
    end
  end

  #ce qu'un joueur va jouer
  def player_selection
    player_name = who_is_playing?
    puts "What's your move #{player_name.name}?"
    print " >" 
    @selection = gets.chomp
    checking_selection
  end

  def checking_selection
    @grid.player_selection_hash(@grid.boardcases_hash, @selection, who_is_playing?.sign)
  end

  def getting_hash_data
    data = @grid.boardcases_hash
  end

end


#binding.pry