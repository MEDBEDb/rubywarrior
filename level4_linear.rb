class Player
def play_turn(warrior)
@max_health = 20
@current_health = warrior.health
 if warrior.feel.empty? and warrior.health == @max_health 
  warrior.walk!
 elsif warrior.feel.empty? and @current_health >= @health
  warrior.rest!
 elsif warrior.feel.enemy? 
  warrior.attack!
 else 
  warrior.walk!
  end
  @health = warrior.health
 end
end
