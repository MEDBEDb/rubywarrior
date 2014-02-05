class Player
  def initialize
  @max_health = 20
  end
  
  def attacks(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    else
      warrior.walk!
    end
  end
  
  def play_turn(warrior)
    attacks(warrior)
  end
end
