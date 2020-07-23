# Application : cette classe va nous permettre de lancer le jeu. 
# Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.

require_relative 'game'
require_relative 'show'


class Application
  attr_accessor :game, :board_to_show, :hash

  def initialize
    @game = Game.new
    @hash = Hash.new
    @board_to_show = Show.new
    party
  end
  
  def party
    showing_presentation_menu
    @game.creating_players
    showing_board
    while @game.is_going? == true
      @game.player_selection
      @game.is_going?
      showing_board
    end
  end

  def showing_board
    @board_to_show.show_board(getting_data)
  end

  def getting_data
    @game.grid.boardcases_hash
  end

  def player_selection
    @game.player_selection
  end

  def showing_presentation_menu
    @board_to_show.presentation_menu
  end

end
