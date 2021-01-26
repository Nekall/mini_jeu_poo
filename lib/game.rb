require 'pry'

class Game
  attr_accessor :human_player
  attr_accessor :enemies
  @@enemies = []
#Méthode d'initialisation nom user + creation 4 ennemies
  def initialize(human_player)
    @human_player = HumanPlayer.new(human_player)
    @@enemies << @player1 = Player.new("Josiane")
    @@enemies << @player2 = Player.new("José")
    @@enemies << @player3 = Player.new("Josette")
    @@enemies << @player4 = Player.new("Jo")
  end
#Méthode qui supprime un bots de l'array quand il est mort
  def kill_player(bot)
    @@enemies.each do |current_bots|
      if(current_bots.life_points == 0)
        then @@enemies.delete(current_bots)
      end
    end
  end
#Méthode, le jeu est t-il toujours en cours ?
  def is_still_ongoing?
    if((@human_player.life_points) == 0 or (@@enemies.count-1 == 0))
      then return false
      else return true
    end
  end
#Méthode affichant l'état des joueurs
  def show_players
    @human_player.show_state
    puts "Il reste #{@@enemies.count-1} ennemis."
  end
#Menu interactif - Affichage des choix
  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts " "
    puts "attaquer un joueur en vue :"

    if(@player1.life_points == 0)
      then kill_player(@player1)
      else puts "0 - "
           print @player1.show_state
    end
    if(@player2.life_points == 0)
      then kill_player(@player2)
      else puts "1 - "
           puts @player2.show_state
    end
    if(@player3.life_points == 0)
      then kill_player(@player3)
      else puts "2 - "
           print @player3.show_state
    end
    if(@player4.life_points == 0)
      then kill_player(@player4)
      else puts "3 - "
           puts @player4.show_state
    end
  end
#Menu interactif - Choix de l'user
  def menu_choice
    puts "Votre réponse :"
    print ">"
    user_answer = gets.chomp

    if(user_answer == "a")
      then @human_player.search_weapon
    end
    if(user_answer == "s")
      then @human_player.search_health_pack
    end
    if(user_answer == 0.to_s)
      then @human_player.attacks(@player1)
    end
    if(user_answer == 1.to_s)
      then @human_player.attacks(@player2)
    end
    if(user_answer == 2.to_s)
      then @human_player.attacks(@player3)
    end
    if(user_answer == 3.to_s)
      then @human_player.attacks(@player4)
    end
  end
#Méthode d'attaque des ennemis
  def enemies_attack
    @@enemies.each do |current_bots|
        current_bots.attacks(@human_player)
    end
  end
#Méthode finale
  def end
    puts "La partie est finie"
    if(@human_player.life_points != 0)
      then abort("BRAVO ! TU AS GAGNE !")
      else abort("Loser ! Tu as perdu !")
    end
  end
end
