class Player
  def initialize
    @max_health = 20
    @mid_health = @max_health/2
    @last_health = @max_health
  end
  
  def attacks(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    else
      warrior.walk!
    end
  end
  
  def diminishing_health(warrior)
    warrior.health < @last_health
  end

  def play_turn(warrior)
    if diminishing_health(warrior)
      attacks(warrior)
    elsif !diminishing_health(warrior) and warrior.health < @max_health 
      warrior.rest!
    else 
      attacks(warrior)
    end
    @last_health = warrior.health
  end
end
