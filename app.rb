require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

#Creation des joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")
#Combats jusqu'a la mort d'un des deux joueurs
while(player1.life_points != 0 or player2.life_points != 0)
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state

  puts "Passons à la phase d'attaque !"
  player1.attacks(player2)
  break if(player2.life_points == 0)
  player2.attacks(player1)
end



#binding.pry
#puts "C'est la fin"
