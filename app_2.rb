require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

#Accueil du jeu
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts " "

#Creation de l'human-player
puts "Entre ton pseudo :"
print ">"
player_name = gets.chomp
player0 = HumanPlayer.new(player_name)

#Creation d'un array d'ennemies
@@enemies = []

#Creation des joueurs
@@enemies << player1 = Player.new("Josiane")
@@enemies << player2 = Player.new("José")

#Combats jusqu'a la mort, condition = mort de l'human-player ou des 2 bots
while((player1.life_points != 0 and player2.life_points != 0) or player0.life_points != 0)
  player0.show_state

  break if((player1.life_points == 0 and player2.life_points == 0) or player0.life_points == 0)

  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts " "
  puts "attaquer un joueur en vue :"
  puts "0 - "
  print player1.show_state
  puts "1 - "
  puts player2.show_state

puts "Votre réponse :"
print ">"
  user_answer = gets.chomp

  if(user_answer == "a")
    then player0.search_weapon
  end
  if(user_answer == "s")
    then player0.search_health_pack
  end
  if(user_answer == 0.to_s)
    then player0.attacks(player1)
  end
  if(user_answer == 1.to_s)
    then player0.attacks(player2)
  end
  puts " "
  puts "Les autres joueurs t'attaquent !"

  @@enemies.each do |current_player|
    if(current_player.life_points != 0)
      then current_player.attacks(player0)
    end
  end

end

#Message de fin du jeu
puts "La partie est finie"
if(player0.life_points != 0)
  then "BRAVO ! TU AS GAGNE !"
  else "Loser ! Tu as perdu !"
end

#puts "Voici l'état de chaque joueur :"
#player1.show_state
#player2.show_state

#puts "Passons à la phase d'attaque !"
#player1.attacks(player2)
#break if(player2.life_points == 0)
#player2.attacks(player1)
