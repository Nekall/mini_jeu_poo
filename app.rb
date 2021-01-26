require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

#Creation des joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")
#Combats jusqu'a la mort d'un des deux joueurs
while true
  break if(player1.life_points == 0 or player2.life_points == 0)
  puts "Voici l'état de nos joueurs :"
  puts " "
  puts player1.show_state
  puts player2.show_state

  puts " "
  puts "Passons à la phase d'attaque !"
  puts player1.attacks(player2)
  break if(player2.life_points == 0)
  puts player2.attacks(player1)
end



#binding.pry
#puts "C'est la fin"
