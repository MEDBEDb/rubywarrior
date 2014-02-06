class Player
def play_turn(warrior)
@maxlas_health = 20
@danger_health = 9
@current_health = warrior.health

 if warrior.feel.empty? and warrior.health == @max_health 
  warrior.walk!
 elsif warrior.feel.empty? and @current_health >= @health
  warrior.rest!
elsif warrior.health < @danger_health and @current_health < @health
  warrior.walk!(:backward)
 elsif warrior.feel.enemy? 
  warrior.attack!
 elsif warrior.feel.captive?
  warrior.rescue!
 else 
  warrior.walk!
  end

  @health = warrior.health

 end
end
