require 'pry'

class Player
  attr_accessor :name
  attr_accessor :life_points
  attr_accessor :attacked_player

#Métode de creation d'un joueur
  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end
#Méthode pour affichez les stats d'un joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end
#Méthode qui inflige des dégats à un joueur
  def gets_damage(damage_points)
    @@attacked_player.life_points = (@@attacked_player.life_points - damage_points)
    if(@@attacked_player.life_points < 0) then (@@attacked_player.life_points = 0)
    end
    if(@@attacked_player.life_points == 0)
      then puts "Le joueur #{@@attacked_player.name} a été tué !"
    end
  end
#Méthode d'attaque
  def attacks(attacked_player)
    @@attacked_player = attacked_player
    dice_result = compute_damage
    puts "le joueur #{@name} attaque le joueur #{attacked_player.name}"
    gets_damage(dice_result)
    puts "il lui inflige #{dice_result} points de damage"
  end
#Randomizer dice
  def compute_damage
    return rand(1..6)
  end

end
