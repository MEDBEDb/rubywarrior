class Player
def play_turn(warrior)
@max_health = 20
@current_health = warrior.health
@danger_health = 9

 if warrior.feel.wall?
  warrior.pivot!
 elsif warrior.feel.empty? and warrior.health == @max_health 
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
