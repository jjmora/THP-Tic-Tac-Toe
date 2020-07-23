# BoardCase : c'est une case. Il devrait y avoir 9 instances de cette classe lors d'une partie.
# chacune des 9 instances de BoardCase correspond à l'état d'une case du plateau.

# Variables d'instance : une Boardcase est définie par sa position (A1, B2, B3, etc.) et son contenu (Soit elle est vide, 
# soit elle a comme valeur le string "x", soit elle a comme valeur le string "o").
require 'pry'
class BoardCase
  attr_accessor :position, :value

  def initialize(value = " ")
    @position = ["A1", "A2","A3","B1","B2","B3","C1","C2","C3"]
    @value = [" ", "x", "o"]
  end

end



