class Player
  def initialize
    @max_health = 20
    @mid_health = @max_health/2
  end
  
  def attacks(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    else
      warrior.walk!
    end
  end

  def play_turn(warrior)
    if warrior.feel.empty? and warrior.health < @mid_health
      warrior.rest!
    else 
      attacks(warrior)
    end  
  end 
end
